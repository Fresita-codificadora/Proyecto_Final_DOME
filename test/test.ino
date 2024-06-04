#include <Wire.h>

void setup() {
  // put your setup code here, to run once:
  Wire.begin();
  Wire.beginTransmission(0xBA);
  Wire.write(0x07);
  Wire.write(0x00);
  Wire.write(0x02);
  Wire.endTransmission(stop);
}

void loop() {
  // put your main code here, to run repeatedly:

}
