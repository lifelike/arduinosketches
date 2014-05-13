/*
  Blink Twice with ATTiny
  
  The default Blink sketch, but blink twice fast, then pause. This is
  because the Arduinos I tested came pre-programmed with Blink, and
  I wanted something to test programming with to see that something
  actually happens. :)
  
  Changed pin number from 13 to 0 to run on ATTiny85 (should run also
  on many other types of ATTiny).
  
  Digital Pin 0 is pin 5 on the IC.
  
  See:
  http://highlowtech.org/?p=1695
  http://www.instructables.com/id/How-to-program-attiny-using-arduino-uno/
  https://github.com/damellis/attiny/
  
  attiny is a git submodule of this git repo, found under external,
  and symlinked from hardware subdir. That makes the ATTiny options
  show up in Arduino Tools menu (at least on a system that understands
  symlinks).

 */

void setup() {                
  pinMode(0, OUTPUT);     
}

void loop() {
  digitalWrite(0, HIGH);   // set the LED on
  delay(100);              // wait for a second
  digitalWrite(0, LOW);   // set the LED on
  delay(100);              // wait for a second
  digitalWrite(0, HIGH);   // set the LED on
  delay(100);              // wait for a second
  digitalWrite(0, LOW);   // set the LED on
  delay(700);              // wait for a second
}
