/** \file
 *
 *  Header file for Descriptors.c.
 */

#ifndef _MSDESCRIPTORS_H_
#define _MSDESCRIPTORS_H_

	/* Includes: */
		#include <avr/pgmspace.h>

		#include <LUFA/Drivers/USB/USB.h>

		#include "Config/AppConfig.h"
		
	/* Macros: */
		/** Endpoint address of the Mass Storage device-to-host data IN endpoint. */
		#define MASS_STORAGE_IN_EPADDR         (ENDPOINT_DIR_IN  | 1)

		/** Endpoint address of the Mass Storage host-to-device data OUT endpoint. */
		#define MASS_STORAGE_OUT_EPADDR        (ENDPOINT_DIR_OUT | 2)

		/** Size in bytes of the Mass Storage data endpoints. */
		#define MASS_STORAGE_IO_EPSIZE         64

	/* Type Defines: */
		/** Type define for the device configuration descriptor structure. This must be defined in the
		 *  application code, as the configuration descriptor contains several sub-descriptors which
		 *  vary between devices, and which describe the device's usage to the host.
		 */
		typedef struct
		{
			USB_Descriptor_Configuration_Header_t  Config;

			// Mass Storage Interface
			USB_Descriptor_Interface_t             MS_Interface;
			USB_Descriptor_Endpoint_t              MS_DataInEndpoint;
			USB_Descriptor_Endpoint_t              MS_DataOutEndpoint;
		} MS_USB_Descriptor_Configuration_t;

	/* Function Prototypes: */
		uint16_t MS_GetDescriptor(const uint16_t wValue,
		                              const uint8_t wIndex,
		                              const void** const DescriptorAddress,
		                              uint8_t* const DescriptorMemorySpace)
		                              ATTR_WARN_UNUSED_RESULT ATTR_NON_NULL_PTR_ARG(3) ATTR_NON_NULL_PTR_ARG(4);

#endif
