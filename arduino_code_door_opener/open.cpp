#include "Open.h"
#include "door_open_header.h"
#include <>
#include <servo.h>
//Opener constructor
Open::Open()
{
	Door.open();
}
// Opener member function
void Open::getStatus(string doorReferenceNumber){
    
}
void Open::open(string doorReferenceNumber)
{
    getStatus();
    servo.attach(servoPin);
	servo.write(0)
	delay(500);
	servo.detach();
	digitalWrite(LCDpin,HIGH)
    
    updateDatabse();
    changeServoStatus(doorname, ture);
}
