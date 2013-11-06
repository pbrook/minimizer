#ifndef MINIMIZER_H
#define MINIMIZER_H

/* Pin mappings:
  Button PC4
  DIP1 (hardwired power)
  DIP2 PC5
  DIP3 PD4
  DIP4 PC7
  DIP5 PB6
  DIP6 PB5
  DIP7 (hardwired mega328)
  DIP8 (hardwired tiny2313)
  LED PB0
  Power enable PC2
*/

#ifndef BOARD_MINIMUS
#error Unsupported board
#endif

#define DIP_PORTB_MASK ((1<<4) | (1<<5) | (1<<6))
#define DIP_PORTC_MASK ((1<<4) | (1<<5) | (1<<7))

#define DIP_BUTTON_MASK (1 << 4)
#define DIP_BUTTON_PIN PINC

// DIP2
#define DIP_MSD_MASK (1 << 5)
#define DIP_MSD_PIN PINC

// DIP4
#define DIP_SILENT_MASK (1 << 7)
#define DIP_SILENT_PIN PINC

// DIP5
#define DIP_POWER_MASK (1 << 6)
#define DIP_POWER_PIN PINB

#define POWER_MASK (1 << 2)
#define POWER_PORT PORTC
#define POWER_DDR DDRC

void minimizer_init(void);
void minimizer_set_power(bool on);

#endif
