#include <Servo.h>
#include <string.h>
#include <door_opener_header.h>
void setup() {
  Serial.begin(9600);
}
void loop() {
  digitalWrite(trigPin,HIGH);
  if (distance <= 100) {
    validation = Firebase.getString("User", "announcement");
    delay(1000);
    if (validation == "Authorized") { //see if the person's authorized, then utilize the servo, and turn on the LED
      servo.attach(servoPin);
      servo.write(0)
      delay(500);
      servo.detach();
      digitalWrite(LCDpin, HIGH);//notify user it's on
      Firebase.setString("servo", "true");
      servo1 = Firebase.getString("servo")
              delay(30000);
      if (servo1 == "true" && MagneticSwitch) {
        delay(1000);
        servo.attach(servoPin);
        servo.write(180);
        delay(500);
        servo.detach();
        delay(3000);
      }

    }
  }

}
}
