#include <Servo.h>
Servo myservo;
int pos = 0;
void setup() {
  // put your setup code here, to run once:
  myservo.attach(9);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  for (pos = 0; pos <= 180; pos+= 1)
  {
    myservo.write(pos);
    delay(15);  
  }
  for (pos = 180; pos>= 0; pos -= 1)
  {
    myservo.write(pos);
    delay(15);
  }

}
