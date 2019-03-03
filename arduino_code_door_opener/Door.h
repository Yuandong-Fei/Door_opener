#ifndef DOOR_H
#define DOOR_H
#include "door_opener_header.h"
#include <string>
class Door
{
private:
    string doorNumber;
    bool doorStatus;
    bool authorizeStatus;
    string doorMessage;

public:
    void openDoor(doorNumber);
    void getRoom();
    bool getStatus(doorNumber);
    bool verifyStatus(doorNumber);
    void open(doorNumber);
    void getMessage(doorNumber);
    void closeDoor(doorNumber);
};

#endif	
