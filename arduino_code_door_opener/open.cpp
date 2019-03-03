#include "open.h"
#include "door_open_header.h"
#include <string>
#include <servo.h>
#include <ESP8266WIFI.h>
#include <FirebaseArduino.h>
// Door member function
void Door::getRoom(){
	doorNumber = Firebase.getString(Door);
}
void Door::getStatus(doorNumber){
	doorStatus = Firebase.getString(Door/doorNumber/Status);

}
void Door::verifyStatus(doorNumber){
	authorizeStatus = Firebase.getString(Door/doorNumber/FaceIDAuthorized);
}
void Door::getMessage(doorNumber){
	doorMessage = Firebase.getString(Door/doorNumber/Message)
}
void Door::updateDatabaseStatus(doorNumber){
	Firebase.setBool(Door/doorNumber/"Status",true)
}
void Door::openDoor(doorNumber)
{
    getStatus(doorNumber);
    servo.attach(servoPin);
	servo.write(0)
	delay(500);
	servo.detach();
	digitalWrite(LCDpin,HIGH)
    updateDatabseStatus(doorNumber);
}

void Door::closeDoor(doorNumber){
	getStatus(doorNumber);
	delay(1000);
	servo.attach(servoPin);
	servo.write(180);
	delay(500);
	servo.detach();
	delay(3000);
}