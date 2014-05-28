http://balau82.wordpress.com/2011/03/29/programming-arduino-uno-in-pure-c/

* Arduino Nano328. Ubuntu laptop. That blink LED example.
avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o test.o test.c
avr-gcc -mmcu=atmega328p test.o -o test
avr-objcopy -O ihex -R .eeprom  test test.hex
avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyUSB0 -b 57600 -U flash:w:test.hex


* ATTiny85 as tiny PWM oscillator (TO BE COMPLETED)
avr-gcc -Os -DF_CPU=16000000UL -mmcu=attiny85 -c -o tinyosc.o tinyosc.c
avr-gcc -mmcu=attiny85 tinyosc.o -o tinyosc
avr-objcopy -O ihex -R .eeprom tinyosc tinyosc.hex
avrdude TODO
