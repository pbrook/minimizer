#include "AVRISP-MKII.h"
#include <LUFA/Drivers/Board/Buttons.h>
#include <ff.h>

#include "minimizer.h"

#define FUSE_WRITE_DELAY 10
#define CHIP_ERASE_DELAY 100

#define AUDIO_SCALE 12

#define BEEP_MASK (1 << 7)
void
LogByte(const uint8_t Byte)
{
  static int count;

  if (count) {
      count--;
      return;
  }
  if ((DIP_SILENT_PIN & DIP_SILENT_MASK) == 0)
    return;
  if (Byte & 1)
      PORTB |= BEEP_MASK;
  else
      PORTB &= ~(BEEP_MASK);
  count = AUDIO_SCALE;
}

static void
blink(uint8_t led)
{
  int i;

  for (i = 0; i < 10; i++) {
      LEDs_SetAllLEDs(led);
      Delay_MS(100);
      LEDs_SetAllLEDs(0);
      Delay_MS(100);
  }
}

#if 0
void
flash(void)
{
  LEDs_SetAllLEDs(LEDS_LED1);
  Delay_MS(200);
  LEDs_SetAllLEDs(0);
  Delay_MS(200);
}
#endif

#if _USE_LFN
WCHAR ff_convert (WCHAR c, UINT i)
{
  if (c > 127)
    return '?';
  return c;
}

WCHAR ff_wtoupper (WCHAR c)
{
  if (c >= 'a' && c <= 'z')
    return c + 'A' - 'a';
  return c;
}
#endif

static uint8_t
do_cmd(const uint32_t cmd)
{
  ISPTarget_SendByte(cmd >> 24);
  ISPTarget_SendByte((cmd >> 16) & 0xff);
  ISPTarget_SendByte((cmd >> 8) & 0xff);
  return ISPTarget_TransferByte(cmd & 0xff);
}

enum fuse_id {
    FUSE_LOW,
    FUSE_HIGH,
    FUSE_EXT,
    FUSE_LOCK
};

/* Returns true if fuse was programmed successfully.  */
static bool
mm_SetFuse(enum fuse_id id, uint8_t val)
{
  uint8_t old;
  uint32_t read_cmd = 0;
  uint32_t write_cmd = 0;
  if (id == FUSE_LOW) {
      read_cmd = 0x5000;
      write_cmd = 0xaca0;
  } else if (id == FUSE_HIGH) {
      read_cmd = 0x5808;
      write_cmd = 0xaca8;
  } else if (id == FUSE_EXT) {
      read_cmd = 0x5008;
      write_cmd = 0xaca4;
  } else if (id == FUSE_LOCK) {
      read_cmd = 0x5800;
      write_cmd = 0xace0;
  }
  read_cmd <<= 16;
  write_cmd <<= 16;

  old = do_cmd(read_cmd);
  if (old == val)
    return true;
  do_cmd(write_cmd | val);
  Delay_MS(FUSE_WRITE_DELAY);
  old = do_cmd(read_cmd);
  return (old == val);
}

static void
mm_EraseChip(void)
{
  do_cmd(0xac977f00ul);
  Delay_MS(CHIP_ERASE_DELAY);
}

bool isp_power;

static void update_power(void)
{
  bool override = (DIP_POWER_PIN & DIP_POWER_MASK) == 0;

  if ((isp_power || override) && !storage_mode)
    POWER_PORT &= ~POWER_MASK;
  else
    POWER_PORT |= POWER_MASK;
}

void
minimizer_set_power(bool on)
{
  isp_power = on;
  update_power();
}

/* Release target from reset.  */
static void
mm_Release(void)
{
  AUX_LINE_DDR &= ~AUX_LINE_MASK;
  AUX_LINE_PORT &= ~AUX_LINE_MASK;

  isp_power = false;
  update_power();
}

/* Reset target ready for programming.  */
static void
mm_Reset(void)
{
  SPI_Init(SPI_SPEED_FCPU_DIV_128 | SPI_ORDER_MSB_FIRST | SPI_SCK_LEAD_RISING | SPI_SAMPLE_LEADING | SPI_MODE_MASTER);
  AUX_LINE_DDR |= AUX_LINE_MASK;
  AUX_LINE_PORT &= ~AUX_LINE_MASK;

  isp_power = true;
  update_power();
}

static bool
mm_StartISP(void)
{
  uint8_t id;
  mm_Release();
  Delay_MS(100);
  mm_Reset();
  Delay_MS(100);
  SPI_SendByte(0xac);
  SPI_SendByte(0x53);
  id = SPI_TransferByte(0);
  SPI_SendByte(0);
  return id != 0x53;
}

static int8_t
strcmp_p(const char *a, PGM_P b)
{
  char ca;
  char cb;
  while (true) {
      ca = *(a++);
      cb = pgm_read_byte(b);
      b++;
      if (ca != cb)
	return (ca < cb) ? -1 : 1;
      if (ca == 0)
	return 0;
  }
}

FIL fh;

static char config_filename[_MAX_LFN + 1];
static uint8_t config_fuse[4];
static uint8_t seen_fuse;
static uint32_t config_page_mask;

#define VAR_NAME_MAX_LEN 5
static char var_name[VAR_NAME_MAX_LEN + 1];
static char var_value[_MAX_LFN + 1];

/* Return false on EOF.  Zero length var_value indicates parse error */
static bool
parse_line(void)
{
  char *p;
  UINT count;
  int len;
  bool comment;

  var_value[0] = 0;
  p = var_name;
  len = VAR_NAME_MAX_LEN;
  comment = false;

  while (true) {
      f_read(&fh, p, 1, &count);
      if (count == 0)
	return false;
      if (comment) {
	  if (*p == '\n')
	    comment = false;
	  continue;
      }
      if (*p == '#' && p == var_name) {
	  comment = true;
	  continue;
      }
      if (*p == '=') {
	  *p = 0;
	  p = var_value;
	  len = _MAX_LFN;
      } else if (*p == ' ' || *p == '\r' || *p == '\t') {
	  /* Ignore character.  */
      } else if (*p == '\n') {
	  *p = 0;
	  return true;
      } else {
	  if (len == 0) {
	      var_value[0] = 0;
	      return true;
	  }
	  p++;
	  len--;
      }
  }
}

/* Parse a positive number.  Returns -1 on error.  */
static int
parse_number(const char *s)
{
  int val;
  char c;
  val = 0;
  if (s[0] == '0') {
      if (s[1] != 'x')
	return -1;
      s += 2;
      while (true) {
	  c = *(s++);
	  if (c == 0)
	    return val;
	  if (c >= '0' && c <= '9')
	    val = (val << 4) | (c - '0');
	  else if (c >= 'a' && c <= 'f')
	    val = (val << 4) | (c + 10 - 'a');
	  else if (c >= 'A' && c <= 'F')
	    val = (val << 4) | (c + 10 - 'A');
	  else
	    return -1;
      }
  } else {
      while (true) {
	c = *(s++);
	if (c == 0)
	  return val;
	if (c >= '0' && c <= '9')
	  val = (val * 10) + (c - '0');
	else
	  return -1;
      }
  }
}

/* Return true if ID is valid.
   Also reads fuse values from config file.  */
static bool
mm_VerifyID(void)
{
  uint32_t id;
  int i;
  uint8_t val;
  FRESULT rc;

  id = 0;
  for (i = 0; i < 3; i++)
    id = (id << 8) | do_cmd(0x30000000 | (i << 8));

  for (i = 0; i < 6; i++) {
      val = (id >> (4*(5 - i))) & 0xf;
      if (val >= 10)
	config_filename[i] = val + 'a' - 10;
      else
	config_filename[i] = val + '0';
  }
  config_filename[6] = '.';
  config_filename[7] = 'c';
  config_filename[8] = 'f';
  config_filename[9] = 'g';
  config_filename[10] = 0;
  rc = f_open(&fh, config_filename, FA_OPEN_EXISTING | FA_READ);
  if (rc != FR_OK)
    return false;

  seen_fuse = 0;
  config_filename[0] = 0;
  config_page_mask = 0;

  while (parse_line()) {
      if (var_name[0] == 0)
	return false;
      if (strcmp_p(var_name, PSTR("lfuse")) == 0) {
	  i = parse_number(var_value);
	  if (i < 0)
	    goto fail;
	  config_fuse[FUSE_LOW] = i;
	  seen_fuse |= 1 << FUSE_LOW;
      } else if (strcmp_p(var_name, PSTR("hfuse")) == 0) {
	  i = parse_number(var_value);
	  if (i < 0)
	    goto fail;
	  config_fuse[FUSE_HIGH] = i;
	  seen_fuse |= 1 << FUSE_HIGH;
      } else if (strcmp_p(var_name, PSTR("efuse")) == 0) {
	  i = parse_number(var_value);
	  if (i < 0)
	    goto fail;
	  config_fuse[FUSE_EXT] = i;
	  seen_fuse |= 1 << FUSE_EXT;
      } else if (strcmp_p(var_name, PSTR("lock")) == 0) {
	  i = parse_number(var_value);
	  if (i < 0)
	    goto fail;
	  config_fuse[FUSE_LOCK] = i;
	  seen_fuse |= 1 << FUSE_LOCK;
      } else if (strcmp_p(var_name, PSTR("page")) == 0) {
	  i = parse_number(var_value);
	  if (i < 0)
	    goto fail;
	  config_page_mask = ~(uint32_t)(i - 1);
      } else if (strcmp_p(var_name, PSTR("file")) == 0) {
	  strcpy(config_filename, var_value);
      }
  }

  f_close(&fh);
  return config_filename[0] != 0 && config_page_mask != 0;

fail:
  f_close(&fh);
  return false;
}

/* parse two digit hex value.  Returns -1 on error.  */
static int
parse_hex(const char *s)
{
  char c;
  uint8_t val;

  c = s[0];
  if (c >= '0' && c <= '9')
    val = c - '0';
  else if (c >= 'A' && c <= 'F')
    val = c + 10 - 'A';
  else if (c >= 'a' && c <= 'f')
    val = c + 10 - 'a';
  else
    return -1;
  val <<= 4;
  c = s[1];
  if (c >='0' && c <= '9')
    val += c - '0';
  else if (c >= 'A' && c <= 'F')
    val += c + 10 - 'A';
  else if (c >= 'a' && c <= 'f')
    val += c + 10 - 'a';
  else
    return -1;
  return val;
}

/* Returns true if data successfully read.  */
static bool
safe_read(void *data, int len)
{
  UINT fcount;

  f_read(&fh, data, len, &fcount);
  if (fcount < len)
    return false;
  return true;
}

static void
mm_WritePage(uint32_t addr)
{
  uint32_t cmd;
  cmd = 0x4c000000ul;
  cmd |= ((addr & config_page_mask) << 7) & 0x00ffff00ul;
  do_cmd(cmd);
  while((do_cmd(0xf0000000ul) & 1) == 1)
    /* No-op */;
}

static bool
flash_hex(bool verify)
{
  uint32_t cmd;
  uint32_t addr;
  uint32_t last_addr;
  uint32_t addr_high;
  uint32_t load_addr_mask;
  bool first;
  int i;
  int len;
  char data[9];
  FRESULT rc;

  rc = f_open(&fh, config_filename, FA_OPEN_EXISTING | FA_READ);
  if (rc != FR_OK)
    return false;

  first = true;
  last_addr = 0;
  addr_high = 0;
  load_addr_mask = (~config_page_mask << 7) & 0x00ffff00ul;
  while (true) {
      if (!safe_read(data, 9))
	goto fail;
      if (data[0] != ':')
	goto fail;
      if (data[7] != '0')
	goto fail;
      if (data[8] == '1') // EOF
	break;
      i = parse_hex(data + 3);
      if (i < 0)
	goto fail;
      addr = (uint16_t)i << 8;
      i = parse_hex(data + 5);
      if (i < 0)
	goto fail;
      addr |= i;
      len = parse_hex(data + 1);
      if (len < 0)
	goto fail;

      if (data[8] == '2') { // segment address
	  if (len != 4 || addr != 0)
	    goto fail;
	  if (!safe_read(data, 4))
	    goto fail;
	  i = parse_hex(data);
	  if (i < 0)
	    goto fail;
	  addr_high = (uint32_t)i << 12;
	  i = parse_hex(data + 2);
	  if (i < 0)
	    goto fail;
	  addr_high |= (uint32_t)i << 4;
      } else if (data[8] == '4') { // Linear address
	  if (len != 4 || addr != 0)
	    goto fail;
	  if (!safe_read(data, 4))
	    goto fail;
	  i = parse_hex(data);
	  if (i < 0)
	    goto fail;
	  addr_high = (uint32_t)i << 24;
	  i = parse_hex(data + 2);
	  if (i < 0)
	    goto fail;
	  addr_high |= (uint32_t)i << 16;
      } else if (data[8] == '3') { // Start address (ignored)
	  if (!safe_read(data, 8))
	    goto fail;
      } else if (data[8] == '0') { // Data
	  addr += addr_high;
	  if (first) {
	      last_addr = addr;
	      first = false;
	  }
	  while (len) {
	      uint32_t changed;
	      changed = last_addr ^ addr;
	      if (changed & config_page_mask) {
		  if (!verify)
		    mm_WritePage(last_addr);
		  if ((changed >> 17) != 0)
		    do_cmd(0x4d000000 | ((addr >> 9) & 0xff00ul));
	      }
	      if (!safe_read(data, 2))
		goto fail;
	      i = parse_hex(data);
	      if (i < 0)
		goto fail;
	      if (verify) {
		  uint8_t rval;
		  if (addr & 1)
		    cmd = 0x28000000ul;
		  else
		    cmd = 0x20000000ul;
		  cmd |= (addr << 7) & 0x00ffff00ul;
		  rval = do_cmd(cmd);
		  if ((uint8_t)i != rval)
		    goto fail;
	      } else {
		  if (addr & 1)
		    cmd = 0x48000000ul;
		  else
		    cmd = 0x40000000ul;
		  cmd |= (addr << 7) & load_addr_mask;
		  do_cmd(cmd | i);
	      }

	      last_addr = addr;
	      addr++;
	      len--;
	  }
      } else { // Unknown record type
	  goto fail;
      }
      if (!safe_read(data, 3))
	goto fail;
      if (data[2] == '\r') {
	  if (!safe_read(data + 2, 1))
	    goto fail;
      }
      if (data[2] != '\n')
	goto fail;
  }
  if (!first) {
      if (!verify)
	mm_WritePage(last_addr);
      if ((last_addr >> 17) != 0)
	do_cmd(0x4d000000);
  }
  f_close(&fh);
  return true;
fail:
  f_close(&fh);
  return false;
}

/* Returns true if flashing was successful.  */
static bool
mm_ProgramFlash(void)
{
  if (!flash_hex(false))
    return false;
  if (!flash_hex(true))
    return false;
  return true;
}

static bool
mm_button(void)
{
  if ((Buttons_GetStatus() & BUTTONS_BUTTON1) != 0)
    return true;
  if ((DIP_BUTTON_PIN & DIP_BUTTON_MASK) == 0)
    return true;
  return false;
}

FATFS fatfs;

void minimizer_init(void)
{
  /* DIP switches.  */
  DDRB &= ~DIP_PORTB_MASK;
  DDRC &= ~DIP_PORTC_MASK;
  DDRD &= ~DIP_PORTC_MASK;
  PORTB |= DIP_PORTB_MASK;
  PORTC |= DIP_PORTC_MASK;
  PORTD |= DIP_PORTC_MASK;

  Buttons_Init();

  /* External LED off.  */
  DDRB |= BEEP_MASK;
  PORTB &= ~BEEP_MASK;

  f_mount(0, &fatfs);

  ISPPageBuffer = f_getbuffer(&fatfs);

  if ((DIP_MSD_PIN & DIP_MSD_MASK) == 0)
    storage_mode = true;

  POWER_DDR |= POWER_MASK;
  update_power();
}

void do_usb_eject(void)
{
  USB_Disable();
  LEDs_SetAllLEDs(0);
  if ((DIP_MSD_PIN & DIP_MSD_MASK) != 0) {
    wdt_enable(WDTO_500MS);
  }
  while(1);
}

/* Returns true if LEDS have been changed.  */
bool
program_minimus(void)
{
  int i;

  update_power();

  if (ISPActive) {
      return false;
  }

  /* Make sure buzzer is idle low.  */
  PORTB &= ~BEEP_MASK;

  if (!mm_button())
    return false;

  if ((DIP_DEBUG_PIN & DIP_DEBUG_MASK) != 0)
    {
      for (i = 0; i < 5; i++) {
	  if (!mm_button())
	    return true;
	  LEDs_SetAllLEDs(LEDS_LED1 | LEDS_LED2);
	  Delay_MS(100);
	  if (!mm_button())
	    return true;
	  LEDs_SetAllLEDs(0);
	  Delay_MS(100);
      }
  }
  LEDs_SetAllLEDs(LEDS_LED1 | LEDS_LED2);
  while (mm_button())
    Delay_MS(1);
  LEDs_SetAllLEDs(0);

  if (mm_StartISP())
    goto fail;
  if (!mm_VerifyID())
    goto fail;
  mm_EraseChip();
  if (!mm_ProgramFlash())
    goto fail;
  for (i = 0; i < 4; i++) {
      if (seen_fuse & (1 << i)) {
	  if (!mm_SetFuse(i, config_fuse[i]))
	    goto fail;
      }
  }
  mm_Release();
  blink(LEDS_LED1);
  ISPPageBuffer = f_getbuffer(&fatfs);
  return true;
fail:
  mm_Release();
  blink(LEDS_LED2);
  ISPPageBuffer = f_getbuffer(&fatfs);
  return true;
}
