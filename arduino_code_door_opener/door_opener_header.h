#ifndef PIN_H
#define PIN

#define echoPin 3
#define trigPin 4
#define LCDpin 5
#define MagneticSwitchpin 6
#define validation
#define servo
#define servoPin
#define servo1

pinMode(echoPin, INPUT);
pinMode(trigPin, OUTPUT);
pinMode(LCDpin, OUTPUT);
pinMode(MagneticSwitchpin, INPUT);
pinMode(servoPin, OUTPUT);
int button = digitalRead(buttonPin);
int MagneticSwitch = digitalRead(MagneticSwitchpin);
int duration = pulseIn(echoPin, HIGH);
int distance = (duration/2) / 29.1;

#endif