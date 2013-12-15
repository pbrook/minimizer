/*
             LUFA Library
     Copyright (C) Dean Camera, 2013.

  dean [at] fourwalledcubicle [dot] com
           www.lufa-lib.org
*/

/*
  Copyright 2013  Dean Camera (dean [at] fourwalledcubicle [dot] com)

  Permission to use, copy, modify, distribute, and sell this
  software and its documentation for any purpose is hereby granted
  without fee, provided that the above copyright notice appear in
  all copies and that both that the copyright notice and this
  permission notice and warranty disclaimer appear in supporting
  documentation, and that the name of the author not be used in
  advertising or publicity pertaining to distribution of the
  software without specific, written prior permission.

  The author disclaims all warranties with regard to this
  software, including all implied warranties of merchantability
  and fitness.  In no event shall the author be liable for any
  special, indirect or consequential damages or any damages
  whatsoever resulting from loss of use, data or profits, whether
  in an action of contract, negligence or other tortious action,
  arising out of or in connection with the use or performance of
  this software.
*/

/** \file
 *
 *  Main source file for the AVRISP project. This file contains the main tasks of
 *  the project and is responsible for the initial application hardware configuration.
 */

#include "AVRISP-MKII.h"
#include "Lib/SCSI.h"
#include <LUFA/Drivers/Board/Dataflash.h>

#if defined(MINIMIZER)
bool storage_mode = false;
// Hack to wait for a while after we are told to power down.
static int reset_wait;
#else
#define storage_mode false
#endif

static uint8_t current_leds;

static void
restore_leds(void)
{
  LEDs_SetAllLEDs(current_leds);
}

static void
set_leds(uint8_t mask)
{
  current_leds = mask;
  restore_leds();
}

#if defined(MINIMIZER)
/** LUFA Mass Storage Class driver interface configuration and state information. This structure is
 *  passed to all Mass Storage Class driver functions, so that multiple instances of the same class
 *  within a device can be differentiated from one another.
 */
USB_ClassInfo_MS_Device_t Disk_MS_Interface =
	{
		.Config =
			{
				.InterfaceNumber                = 2,
				.DataINEndpoint                 =
					{
						.Address                = MASS_STORAGE_IN_EPADDR,
						.Size                   = MASS_STORAGE_IO_EPSIZE,
						.Banks                  = 1,
					},
				.DataOUTEndpoint                =
					{
						.Address                = MASS_STORAGE_OUT_EPADDR,
						.Size                   = MASS_STORAGE_IO_EPSIZE,
						.Banks                  = 1,
					},
				.TotalLUNs                 = 1,
			},
	};
#endif

/** Main program entry point. This routine contains the overall program flow, including initial
 *  setup of all components and the main program loop.
 */
int main(void)
{
	SetupHardware();
	V2Protocol_Init();

	set_leds(LEDMASK_USB_NOTREADY);
	GlobalInterruptEnable();

	for (;;)
	{
		#if (BOARD == BOARD_USBTINYMKII)
		/* On the USBTINY-MKII target, there is a secondary LED which indicates the current selected power
		   mode - either VBUS, or sourced from the VTARGET pin of the programming connectors */
		LEDs_ChangeLEDs(LEDMASK_VBUSPOWER, (PIND & (1 << 0)) ? 0 : LEDMASK_VBUSPOWER);
		#endif

#if defined(MINIMIZER)
		if (storage_mode)
		    MS_Device_USBTask(&Disk_MS_Interface);
		else
#endif
		    AVRISP_Task();
		USB_USBTask();
#ifdef MINIMIZER
		if (!storage_mode && program_minimus())
		  restore_leds();

		if (reset_wait)
		  {
		    reset_wait--;
		    if (reset_wait == 0)
		      do_usb_eject();
		    Delay_MS(1);
		  }
#endif
	}
}

#ifndef MINIMIZER
static uint8_t RealISPPageBuffer[256];
#endif

/** Configures the board hardware and chip peripherals for the demo's functionality. */
void SetupHardware(void)
{
#if (ARCH == ARCH_AVR8)
	/* Disable watchdog if enabled by bootloader/fuses */
	MCUSR &= ~(1 << WDRF);
	wdt_disable();

	/* Disable clock division */
	clock_prescale_set(clock_div_1);
#endif

#ifdef MINIMIZER
	minimizer_init();
#else
	ISPPageBuffer = RealISPPageBuffer;
#endif

	/* Hardware Initialization */
	LEDs_Init();
	#if defined(RESET_TOGGLES_LIBUSB_COMPAT)
	UpdateCurrentCompatibilityMode();
	#endif
	Dataflash_Init();

	/* USB Stack Initialization */
	USB_Init();
}

/** Event handler for the library USB Connection event. */
void EVENT_USB_Device_Connect(void)
{
	set_leds(LEDMASK_USB_ENUMERATING);
}

/** Event handler for the library USB Disconnection event. */
void EVENT_USB_Device_Disconnect(void)
{
	set_leds(LEDMASK_USB_NOTREADY);
}

/** Event handler for the library USB Configuration Changed event. */
static bool AVRISP_USB_Device_ConfigurationChanged(void)
{
	bool ConfigSuccess = true;

	/* Setup AVRISP Data OUT endpoint */
	ConfigSuccess &= Endpoint_ConfigureEndpoint(AVRISP_DATA_OUT_EPADDR, EP_TYPE_BULK, AVRISP_DATA_EPSIZE, 1);

	/* Setup AVRISP Data IN endpoint if it is using a physically different endpoint */
	if ((AVRISP_DATA_IN_EPADDR & ENDPOINT_EPNUM_MASK) != (AVRISP_DATA_OUT_EPADDR & ENDPOINT_EPNUM_MASK))
	  ConfigSuccess &= Endpoint_ConfigureEndpoint(AVRISP_DATA_IN_EPADDR, EP_TYPE_BULK, AVRISP_DATA_EPSIZE, 1);

	return ConfigSuccess;
}

#if defined(MINIMIZER)
static bool MS_USB_Device_ConfigurationChanged(void)
{
	bool ConfigSuccess = true;

	ConfigSuccess &= MS_Device_ConfigureEndpoints(&Disk_MS_Interface);

	return ConfigSuccess;
}
#endif

void EVENT_USB_Device_ConfigurationChanged(void)
{
	bool ConfigSuccess;
#if defined(MINIMIZER)
	if (storage_mode)
	    ConfigSuccess = MS_USB_Device_ConfigurationChanged();
	else
#endif
	    ConfigSuccess = AVRISP_USB_Device_ConfigurationChanged();

	/* Indicate endpoint configuration success or failure */
	set_leds(ConfigSuccess ? LEDMASK_USB_READY : LEDMASK_USB_ERROR);
}

#if defined(MINIMIZER)
/** Event handler for the library USB Control Request reception event. */
void EVENT_USB_Device_ControlRequest(void)
{
    if (storage_mode)
	MS_Device_ProcessControlRequest(&Disk_MS_Interface);
}
#endif

/** Processes incoming V2 Protocol commands from the host, returning a response when required. */
void AVRISP_Task(void)
{
	/* Device must be connected and configured for the task to run */
	if (USB_DeviceState != DEVICE_STATE_Configured)
	  return;

	V2Params_UpdateParamValues();

	Endpoint_SelectEndpoint(AVRISP_DATA_OUT_EPADDR);

	/* Check to see if a V2 Protocol command has been received */
	if (Endpoint_IsOUTReceived())
	{
		set_leds(LEDMASK_BUSY);

		/* Pass off processing of the V2 Protocol command to the V2 Protocol handler */
		V2Protocol_ProcessCommand();

		set_leds(LEDMASK_USB_READY);
	}
}

/** This function is called by the library when in device mode, and must be overridden (see library "USB Descriptors"
 *  documentation) by the application code so that the address and size of a requested descriptor can be given
 *  to the USB library. When the device receives a Get Descriptor request on the control endpoint, this function
 *  is called so that the descriptor details can be passed back and the appropriate descriptor sent back to the
 *  USB host.
 *
 *  \param[in]  wValue                 Descriptor type and index to retrieve
 *  \param[in]  wIndex                 Sub-index to retrieve (such as a localized string language)
 *  \param[out] DescriptorAddress      Address of the retrieved descriptor
 *  \param[out] DescriptorMemorySpace  Memory space that the descriptor is stored in
 *
 *  \return Length of the retrieved descriptor in bytes, or NO_DESCRIPTOR if the descriptor was not found
 */
uint16_t CALLBACK_USB_GetDescriptor(const uint16_t wValue,
                                    const uint8_t wIndex,
                                    const void** const DescriptorAddress,
                                    uint8_t* DescriptorMemorySpace)
{
#if defined(MINIMIZER)
    if (storage_mode)
	return MS_GetDescriptor(wValue, wIndex, DescriptorAddress, DescriptorMemorySpace);
    else
#endif
	return AVRISP_GetDescriptor(wValue, wIndex, DescriptorAddress, DescriptorMemorySpace);
}

/** Mass Storage class driver callback function the reception of SCSI commands from the host, which must be processed.
 *
 *  \param[in] MSInterfaceInfo  Pointer to the Mass Storage class interface configuration structure being referenced
 */
bool CALLBACK_MS_Device_SCSICommandReceived(USB_ClassInfo_MS_Device_t* const MSInterfaceInfo)
{
	bool CommandSuccess;

	set_leds(LEDMASK_BUSY);
	CommandSuccess = SCSI_DecodeSCSICommand(MSInterfaceInfo);
	set_leds(LEDMASK_USB_READY);

	return CommandSuccess;
}

#if defined(MINIMIZER)
void SCSI_Stop(void)
{
  reset_wait = 1000;
}
#endif
