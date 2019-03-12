#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <string>
#include <Servo.h>
#define MagneticSwitchpin 6
#define servoPin 7
#define Door
#define Status
#define MagneticSwitch digitalRead(MagneticSwitchpin)
#define WIFI_SSID "iPhone XS"
#define WIFI_PASSWORD "qwertyuiop"
#define FIREBASE_HOST "arduino-cbf24.firebaseio.com"
#define FIREBASE_AUTH "rS9OB2uPLTx5sWr8wc1aiPEXRjQt1LoWaKhSjqd6"

int pos = 0;
String doorNumber = getRoom();
Servo myservo;

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

bool getVerifiedStatus(String doorNumber) {
  String authorizeStatus = Firebase.getString("Door/doorNumber/FaceIDAuthorized");
  return (authorizeStatus == "True");
}

bool getStatus(String doorNumber) {
  String doorStatus = Firebase.getString("Door/doorNumber/Status");
  return (doorStatus == "True");
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
