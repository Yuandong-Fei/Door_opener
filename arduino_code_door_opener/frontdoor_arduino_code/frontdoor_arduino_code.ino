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
#define FIREBASE_HOST "dooropener-a568d.firebaseio.com"
#define FIREBASE_AUTH "alNdiBnfzlBMnoCFi6XnDdtEKuErIZVqyTkwvTnx"

const int trigPin = D7;
const int echoPin = D5;
const String doorNumber = "CATA5230";
long duration;
double distance;

int pos = 0;
LiquidCrystal lcd(D6, D8, D1, D2, D3, D4);

String getmessage(String doorNumber);

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  lcd.begin(16, 2);
}
bool detectPeople();
void LCDDisplay(String doorNumber);
String getmessage(String doorNumber);
void loop() {
  if (detectPeople()) {
    LCDDisplay(doorNumber);
  }
}

// put your main code here, to run repeatedly:




bool getVerifiedStatus(String doorNumber) {
  bool authorizeStatus = Firebase.getBool("Door/" + doorNumber + "/Authorized");
  return authorizeStatus;
}

String getmessage(String doorNumber) {
  return Firebase.getString("Door/" + doorNumber + "/Message");

}

void LCDDisplay(String doorNumber) {
  String doorMessage = getmessage(doorNumber);
  lcd.print(doorMessage);
  for (int i = 0; i < doorMessage.length(); i++) {
    lcd.scrollDisplayLeft();

    delay(250);
    //lcd.clear();
  }
  lcd.clear();
  delay(300);
  //  lcd.autoscroll();
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
  //  Serial.println(distance);

}
