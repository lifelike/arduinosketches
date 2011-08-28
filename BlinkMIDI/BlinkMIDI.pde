#include <MIDI.h>
/*
 MIDI In test, blinking LED for each beat
 
 Listening for MIDI clock pulses (0xF8). Blink Arduino LED on
 output 13 for each beat (every 24th pulse).
 Tested with MIDI out from Renoise.
 
 MIDI Start (0xFA) resets pulse counter.
 
 This could probably be rewritten to use the MIDI lib callbacks and not to
 busy-loop 100 % CPU all the time.
 
 Breadboard with MIDI IN as described on
  http://www.shaduzlabs.com/article-7.html
 
 Optocoupler 6N137 DIL-8 used.
  pin 2 to MIDI (inner right pin) through 220 Ohm
  pin 3 to MIDI (inner left pin)
  pin 3 to pin 2 through 1N4148 diode
  pin 5 to GND
  pin 6 to Arduino RX (digital input 0)
  pin 6 to +5 V through 1.2 kOhm
  pin 7 through 5.6 kOhm to GND
  pin 8 to +5 V
  MIDI central pin (from cable shield) to GND
 
 (MIDI socket pins as seen from the front. To confuse things though
  the socket I used (PCB 5p type D DIN) looks upside down. The pin directly
  connected to pin 3 on the IC is the 4th counting clockwise. Luckily there
  is a diode to protect the IC from connecting things the wrong way.)
  
  This is also a good reference:
  http://www.midi.org/techspecs/electrispec.php
  
  This setup could be used with a 6N138:
  http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1187962258/
 
 Bug: LED only synchronized properly to beat if playback starts
 at a beat. I guess if song position (0xF2) is sent that could be
 used to synchronize to any position.
*/

#define PPQN 24
#define ledPin 13

int pulses = 0;

void setup() {
  pinMode(ledPin, OUTPUT);
  MIDI.begin();
}

void loop() {
  if (MIDI.read()) {
    kMIDIType type = MIDI.getType();
    if (type == Clock && ++pulses == PPQN) {
          pulses = 0; 
          digitalWrite(ledPin, HIGH);
    } else if (type == Start) {
          pulses = PPQN - 1;
    } else if (pulses == 1) {
      digitalWrite(ledPin, LOW);       
    } 
  }
}
