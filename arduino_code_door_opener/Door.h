#ifndef DOOR_H
#define DOOR_H
#include "door_opener_header.h"
#include <string>
#include <avr/sleep.h>
class Door
{
private:
    string doorNumber;
    bool doorStatus;
    bool authorizeStatus;
    string doorMessage;

public:
    bool detectPeople();
    void openDoor(doorNumber);
    void getRoom();
    bool getStatus(doorNumber);
    bool verifyStatus(doorNumber);
    void open(doorNumber);
    void getMessage(doorNumber);
    void closeDoor(doorNumber);
    void sleepNow();
    void wakeUpNow();
    void updateDatabseStatus(doorNumber);
};

#endif	
