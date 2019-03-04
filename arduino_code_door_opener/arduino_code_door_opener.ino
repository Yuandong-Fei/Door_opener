#include <Servo.h>
#include <string.h>
#include "door_opener_header.h"
#include "door.h"
void setup() {
  Serial.begin(9600);
}
void loop() {
  if (detectPeople()) {
    getRoom();
    verifyStatus(doorNumber);
    if (authorizeStatus) { //see if the person's authorized, then utilize the servo, and turn on the LED
      openDoor(doorNumber);
      if (doorStatus && MagneticSwitch) {
        closeDoor(doorNumber);
      }

    }
  }
}
