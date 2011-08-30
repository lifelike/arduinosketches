/*
  Blink Twice
  
  The default Blink sketch, but blink twice fast, then pause. This is
  because the Arduinos I tested came pre-programmed with Blink, and
  I wanted something to test programming with to see that something
  actually happens. :)

 */

void setup() {                
  pinMode(13, OUTPUT);     
}

void loop() {
  digitalWrite(13, HIGH);   // set the LED on
  delay(100);              // wait for a second
  digitalWrite(13, LOW);   // set the LED on
  delay(100);              // wait for a second
  digitalWrite(13, HIGH);   // set the LED on
  delay(100);              // wait for a second
  digitalWrite(13, LOW);   // set the LED on
  delay(700);              // wait for a second
}
