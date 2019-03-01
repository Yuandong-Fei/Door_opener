#include "Close.h"
#include "door_open_header.h"
#include <iostream>
#include <servo.h>

Close::Close()
{
    Door.close();
}
void Close::Door.close(){
    delay(1000);
    servo.attach(servoPin);
    servo.write(180);
    delay(500);
    servo.detach();
    delay(3000);
}