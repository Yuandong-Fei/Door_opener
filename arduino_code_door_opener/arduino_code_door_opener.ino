#include <Servo.h>
#include <string.h>
int PIRpin = 3; // analog
int buttonPin = 4;
int LCDpin = 5;
int PIRval = 0;
int MagneticSwitchpin = 6;
String validation;

Servo servo;  // define variables for servo use
int servoPin = 4;
String servo1;

void setup() {
  Serial.begin(9600);
  servo.attach(servoPin);
  // define pins:
  pinMode(PIRpin, INPUT);
  pinMode(buttonPin, INPUT);
  pinMode(LCDpin, OUTPUT);
  pinMode(MagneticSwitchpin, INPUT);
  pinMode(servoPin, OUTPUT);
  int button = digitalRead(buttonPin);
  int MagneticSwitch = digitalRead(MagneticSwitchpin);
}
void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(PIRpin);
        //detect people
  if (PIRval <= 780) {
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
