#include <Wire.h>

const int boton=36;

int buttonState=0;
int i=0;
void setup() {
  // put your setup code here, to run once:
  pinMode(boton,INPUT);
  Wire.begin();
  Wire.beginTransmission(0xBA);
  Wire.write(0x07);
  Wire.write(0x00);
  Wire.write(0x02);
  Wire.endTransmission();
}

void loop() {
  // put your main code here, to run repeatedly:
  buttonState = digitalRead(boton);
  if (buttonState==HIGH) {
      for (i=0;i<1;i++){
          Wire.beginTransmission(0xBA);
          Wire.write(0x07);
          Wire.write(0x00);
          Wire.write(0x02);
          Wire.endTransmission();
        }  
    }
}
