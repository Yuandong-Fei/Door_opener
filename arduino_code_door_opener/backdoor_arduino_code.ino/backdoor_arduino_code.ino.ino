#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <string>
#include <Servo.h>
#include <LiquidCrystal.h>

#define PIRSensorPin 5
#define MagneticSwitchpin 6
#define servoPin 7
#define Door
#define Status
#define FaceIDAuthorized
#define Message
#define PIRVal analogRead(PIRSensorPin)
#define MagneticSwitch digitalRead(MagneticSwitchpin)
#define WIFI_SSID "iPhone XS"
#define WIFI_PASSWORD "qwertyuiop"
#define FIREBASE_HOST "arduino-cbf24.firebaseio.com"
#define FIREBASE_AUTH "rS9OB2uPLTx5sWr8wc1aiPEXRjQt1LoWaKhSjqd6"

int pos = 0;
String doorNumber = getRoom();
Servo myservo;
LiquidCrystal lcd(D6, D8, D1, D2, D3, D4);

void setup() {
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  myservo.attach(9);
  pinMode(servoPin, INPUT_PULLUP);// put your setup codehere, to run once:
  doorNumber = getRoom();
}

void loop() {
  if (getVerifiedStatus(doorNumber)) {
    openDoor(doorNumber);
    delay(30000);
    if (!MagneticSwitch && (getStatus(doorNumber))) {
      closeDoor(doorNumber);
    }
  }
  // put your main code here, to run repeatedly:

}
String getRoom() {
  String doorNumber = Firebase.getString("Door");
  return doorNumber;
}

bool getStatus(String doorNumber) {
  String doorStatus = Firebase.getString("Door/doorNumber/Status");
  if (doorStatus == "True" ) {
    return true;
  }
  else {
    return false;
  }
}

bool getVerifiedStatus(String doorNumber) {
  String authorizeStatus = Firebase.getString("Door/doorNumber/FaceIDAuthorized");
  if (authorizeStatus == "True" ) {
    return true;
  }
  else {
    return false;
  }
}

String getMessage(String doorNumber) {
  String doorMessage = Firebase.getString("Door/doorNumber/Message");
  return doorMessage;
}

void LCDDisplay(String doorNumber) {
  String doorMessage = getMessage(doorNumber);
  lcd.print(doorMessage);
  lcd.noDisplay();
  delay(500);
  lcd.display();
  delay(500);
}

void updateDatabaseStatusTrue(String doorNumber) {
  Firebase.setBool("Door/doorNumber/Status", true);
}

void updateDatabaseStatusFalse(String doorNumber) {
  Firebase.setBool("Door/doorNumber/Status", false);
}


void openDoor(String doorNumber)
{
  if (getStatus(doorNumber)) {
    for (pos = 0; pos <= 180; pos += 1) {
      myservo.write(pos);
      delay(15);
    }
    updateDatabaseStatusTrue(doorNumber);
  }
}

void closeDoor(String doorNumber) {
  if (!MagneticSwitch && getStatus(doorNumber)) {
    for (pos = 180; pos >= 0; pos -= 1) {
      myservo.write(pos);
      delay(15);
    }
    updateDatabaseStatusFalse(doorNumber);
  }
}
bool detectPeople() {
  if (PIRVal < 780) {
    return true;
  }
  else {
    return false;
  }
}
