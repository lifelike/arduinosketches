#include <avr/io.h>
#include <util/delay.h>

int main (void) {
    /* set port B 0-3 as outputs */
    DDRB |= 0b00001111 ;

    return 0;
}
