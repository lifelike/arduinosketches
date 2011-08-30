/*

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
