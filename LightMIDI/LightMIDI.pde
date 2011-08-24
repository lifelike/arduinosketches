/*
  Photocell to MIDI control change. Also plays some MIDI notes to
  make it more interesting.
  
  Copyright Pelle Nilsson 2011, GPLv3. Requires MIDI library.
  
  Photo cell (see http://www.ladyada.net/learn/sensors/cds.html)
  connected to +5 V on one side, to ground through 10k resistor
  and Arduino Analog input A0 on the other side.
  
  Digital pin 1 (tx) connected to a MIDI out port (as described in
  http://arduino.cc/en/Tutorial/Midi). MIDI port connected to
  suitable synthesizer using a standard MIDI cable.
  
  Of course any other analog sensor could be used instead of the
  photo cell. I just happened to want to try the light sensor
  when writing this.
  
  Tested with a Waldorf Blofeld. It did not like a too high data rate.
  A 50 ms minimum time between cc events was added. A much lower delay
  may work too. TODO: test that.
  
  There should probably be a small delay added somewhere in the loop,
  or even using a timer.
  That might take care of the cc rate as well, removing the need for
  extra checks to handle that.
 */

#include <MIDI.h>

int ccNumber = 69; // Waldorf Blofeld Filter 1 cutoff
int lightPin = A0;
int tempoPin = A1;
int ccLastValue = -1;
long lastPlayedNoteTime = 0;
long minimumCCInterval = 50; // my Blofeld dislikes too much MIDI traffic
long noteInterval = 500;
long lastSentCCTime = 0;

void setup() { 
  MIDI.begin();
}

void loop() {
  long now = millis();
  if (now - lastPlayedNoteTime > noteInterval) {
    MIDI.sendNoteOff(40, 127, 1);
    MIDI.sendNoteOn(40, 127, 1);
    lastPlayedNoteTime = now;
  }
  if (now - lastSentCCTime > minimumCCInterval) {
    int light = analogRead(lightPin);
    int ccValue = light / 8; // from 0..1023 down to 0..127    
    if (ccValue != ccLastValue) {
      MIDI.sendControlChange(ccNumber, ccValue, 1);
      ccLastValue = ccValue;
      lastSentCCTime = now;
    }
  }  
}
