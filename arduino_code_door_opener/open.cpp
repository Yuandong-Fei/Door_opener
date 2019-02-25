#include "Open.h"
#include "door_open_header.h"
#include <iostream>
#include <servo.h>
//Opener constructor
Opener::Opener()
{
	Door.opener();
}
// Opener member function
void Opener::Dooropener()
{
	servo.attach(servoPin);
	servo.write(0)
	delay(500);
	servo.detach();
	digitalWrite(LCDpin,HIGH)
}
