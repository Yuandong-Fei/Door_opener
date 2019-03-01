#ifndef OPENER_H
#define OPENER_H
#include "door_opener_header.h"
class Door
{
private:
    string name;
    Person a;
public:
	Open()
    void init(string name, Person a);
    
    bool getStatus();
	void open(string door);
    void close()
};

#endif	
