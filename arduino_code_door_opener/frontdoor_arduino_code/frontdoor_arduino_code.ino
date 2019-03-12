#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <string>
#include <LiquidCrystal.h>

#define Door
#define Status
#define FaceIDAuthorized
#define Message
#define WIFI_SSID "iPhone (7)"
#define WIFI_PASSWORD "Mary123456"
#define FIREBASE_HOST "arduino-cbf24.firebaseio.com"
#define FIREBASE_AUTH "rS9OB2uPLTx5sWr8wc1aiPEXRjQt1LoWaKhSjqd6"

const int trigPin = D7;
const int echoPin = D5;
long duration;
double distance;

int pos = 0;
LiquidCrystal lcd(D6, D8, D1, D2, D3, D4);


void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  lcd.begin(16, 2);
}

void loop() {
  if (detectPeople()) {
    String doorNumber = getRoom();
    String doorMessage = getMessage(doorNumber);
    LCDDisplay(Firebase.getString("Message"));

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

bool detectPeople() {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = duration * 0.034 / 2;
  return (distance < 50);

}
