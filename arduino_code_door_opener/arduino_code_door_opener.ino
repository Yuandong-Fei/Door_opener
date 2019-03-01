#include <Servo.h>
#include <string.h>
#include "door_opener_header.h"
#include "open.h"
#include "close.h"
void setup() {
  Serial.begin(9600);
}
void loop() {
  digitalWrite(trigPin,HIGH);
  if (distance <= 100) {
    validation = Firebase.getString("User", "announcement");
    delay(1000);
    if (validation == "Authorized") { //see if the person's authorized, then utilize the servo, and turn on the LED
              door.opener();
              delay(30000);
      if (servo1 == "true" && MagneticSwitch) {
              door.close();
      }

    }
  }

}
}
