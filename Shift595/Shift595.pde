/*
 Shift 595
 
 Controlling 4 LEDs using a 595 chip.
 
 Set up is like http://www.arduino.cc/en/Tutorial/ShiftOut, but
 only 4 LEDs because I'm too lazy to connect more at the moment.
 
 Just for fun using the built-in shiftOut function, although it
 insists on shifting out 8 bits so it is a bit wasteful. Earlier
 versions of this sketch had its own shiftBit function to not
 send more than the 4 needed bits.
*/

const int dataPin = 11;
const int clockPin = 12;
const int latchPin = 10;
const int ledPin = 13;

void setup() {
  pinMode(dataPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(latchPin, OUTPUT);
  pinMode(ledPin, OUTPUT);
}

void shiftLow4Bits(byte data) {
  digitalWrite(latchPin, LOW);
  shiftOut(dataPin, clockPin, LSBFIRST, (data & 0xf) << 4);
  digitalWrite(latchPin, HIGH);
}

void loop() {
  shiftLow4Bits(0);
  delay(500);
  for (int i = 0; i < 4; i++) {
    shiftLow4Bits( 1 << i);
    delay(250);
  }
  for (int i = 0; i < 16; i++) {
    digitalWrite(ledPin, HIGH);
    delay(100);
    digitalWrite(ledPin, LOW);
    shiftLow4Bits(i);
    delay(250);
  }
  for (int i = 0; i < 100; i ++) {
    shiftLow4Bits((i & 1) ? 0xf : 0);
    delay(100);
  }
}
