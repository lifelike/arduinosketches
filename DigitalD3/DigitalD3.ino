/*

Press button to roll a 3-sided die.

Button is connected to D2 (other end of button to GND, with internal pull-up enabled on AVR).
The Arduino built-in LED is used to flash a bit while "rolling" the die.

Rolled die result is shown on three LEDs connected through 220 ohm resistors
to GND from D3, D4, D5 respectively.

*/

const int buttonPin = 2;
const int ledPins[] = {3, 4, 5};
const int internalLedPin = 13;

int value = 0;

void hideDie() {
   digitalWrite(ledPins[0], LOW);
   digitalWrite(ledPins[1], LOW);
   digitalWrite(ledPins[2], LOW);
}

void showDie() {
   digitalWrite(ledPins[0], value > 1 ? HIGH : LOW);
   digitalWrite(ledPins[1], value & 1 ? HIGH : LOW);
   digitalWrite(ledPins[2], value > 1 ? HIGH : LOW);
}

void flashInternalLed(int times, int totalDuration) {
  int halfPeriod = totalDuration / times / 2;
  for (int i = 0; i < times; i++) {
    digitalWrite(internalLedPin, LOW);
    delay(halfPeriod);
    digitalWrite(internalLedPin, HIGH);
    delay(halfPeriod);
  }
}

void setup() {
  pinMode(buttonPin, INPUT);
  digitalWrite(buttonPin, HIGH); //enables internal pull-up
  hideDie();
}

void loop() {
  digitalWrite(internalLedPin, LOW);
  while (digitalRead(buttonPin) == HIGH) {
      showDie();
  }
  hideDie();
  digitalWrite(internalLedPin, HIGH);
  while (digitalRead(buttonPin) == LOW) {
      value = value == 3 ? 1 : value + 1;
  }
  flashInternalLed(5, 250);
}
