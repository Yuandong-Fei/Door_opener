int echoPin = 3;
int trigPin = 4;
int LCDpin = 5;
int MagneticSwitchpin = 6;
String validation;

Servo servo;  // define variables for servo use
int servoPin = 4;
String servo1;

void setup() {
  Serial.begin(9600);
  servo.attach(servoPin);
  // define pins:
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);
  pinMode(LCDpin, OUTPUT);
  pinMode(MagneticSwitchpin, INPUT);
  pinMode(servoPin, OUTPUT);
  int button = digitalRead(buttonPin);
  int MagneticSwitch = digitalRead(MagneticSwitchpin);
  int duration = pulseIn(echoPin, HIGH);
  int distance = (duration/2) / 29.1;
