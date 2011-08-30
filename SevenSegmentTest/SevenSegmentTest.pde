/*
Testing a seven segment LED display

Just turning on some segments of a til322a 7-segment display.

Pin layout is:
1 e
2 d
3 GND
4 c
5 dot
6 b
7 a
8 GND
9 f
10 g

(First pin is lower left.)

I connected pin 3 to GND, and pins 1, 2, 4, and 5 to
Arduino outputs 9, 10, 11, and 12, each through a 1kOhm
resistor.

This test doesn't make a lot of sense, just shows the lower
four segments light up in a boring repetetive pattern.
*/

void setup() {
 pinMode(9, OUTPUT);
 pinMode(10, OUTPUT);
 pinMode(11, OUTPUT);
 pinMode(12, OUTPUT);
 pinMode(13, OUTPUT);
 digitalWrite(12, HIGH);
}

void loop() {
  digitalWrite(13, HIGH);
  delay(200);
  digitalWrite(12, LOW);
  digitalWrite(13, LOW);
  digitalWrite(9, HIGH);
  delay(200);
  digitalWrite(9, LOW);
  digitalWrite(10, HIGH);
  delay(200);
  digitalWrite(10, LOW);
  digitalWrite(11, HIGH);
  delay(200);
  digitalWrite(9, HIGH);
  digitalWrite(10, HIGH);
  digitalWrite(12, HIGH);
  delay(400);
  digitalWrite(11, LOW);
  digitalWrite(9, LOW);
  digitalWrite(10, LOW);
}
