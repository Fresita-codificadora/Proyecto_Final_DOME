#include <Wire.h>

// Definimos los pines
const int button = 36;  // Pin donde está conectado el botón


// Variable para guardar el estado del botón
int buttonState = 0;

// Variable para asegurarnos de que la acción se ejecuta solo una vez
bool actionExecuted = false;

void setup() {
  // Configuramos el pin del botón como entrada
  pinMode(button, INPUT_PULLUP);
  Wire.begin();
 
}

void loop() {
  // Leemos el estado del botón
  buttonState = digitalRead(button);

  // Si el botón está presionado (LOW debido al pull-up)
  if (buttonState == LOW && !actionExecuted) {
    // Ejecutamos la serie de acciones
    executeActions();

    // Marcamos la acción como ejecutada para no repetirla
    actionExecuted = true;
  }

}

void executeActions() {
          Wire.beginTransmission(0xBA);
          Wire.write(0x07);
          Wire.write(0x00);
          Wire.write(0x02);
          Wire.endTransmission();
}
