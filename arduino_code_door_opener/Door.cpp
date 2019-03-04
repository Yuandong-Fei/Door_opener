#include "open.h"
#include "door_open_header.h"
#include <string>
#include <servo.h>
#include <ESP8266WIFI.h>
#include <FirebaseArduino.h>
// Door member function
void Door::getRoom(){
	doorNumber = Firebase.getString(Door);
	//get room number
}

bool Door::getStatus(doorNumber){
	doorStatus = Firebase.getString(Door/doorNumber/Status);
	//used for magneticswitch
}

bool Door::verifyStatus(doorNumber){
	authorizeStatus = Firebase.getString(Door/doorNumber/FaceIDAuthorized);
	//see if the person is authorized to get in
}

void Door::getMessage(doorNumber){
	doorMessage = Firebase.getString(Door/doorNumber/Message)
	//get the message to display on the LCD
}

void Door::updateDatabaseStatus(doorNumber){
	Firebase.setBool(Door/doorNumber/"Status",true)
	//update the door status on the database
}

void Door::openDoor(doorNumber)
{
    servo.attach(servoPin);
	servo.write(0)
	delay(500);
	servo.detach();
	digitalWrite(LCDpin,HIGH)
    updateDatabaseStatus(doorNumber);
	getStatus(doorNumber);
}

void Door::closeDoor(doorNumber){
	delay(1000);
	servo.attach(servoPin);
	servo.write(180);
	delay(500);
	servo.detach();
	delay(3000);
}

bool Door::detectPeople(){
digitalWrite(trigPin,HIGH);
	if (distance <= 100){
		return true;
	}
	else{
		return false;
	}
}

void Door::sleepNow(){

}