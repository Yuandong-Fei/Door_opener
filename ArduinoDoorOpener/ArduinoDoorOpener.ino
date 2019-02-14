#include "Controller.h"
void setup() {
  Serial.begin(9600);
  // define pins:
  pinMode(PIRpin,INPUT);
  pinMode(buttonPin,INPUT);
  pinMode(servoPin,OUTPUT);
  pinMode(LCDpin,OUTPUT);
  pinMode(MSpin,INPUT);
  int button = digitalRead(buttonPin);
  int servo = digitalRead(servoPin);
  int MS = digitalRead(MSpin);
}
void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(PIRpin)
  //detect people
  if (val <= 1018){
    Firebase.getFloat("user");
    delay(1000);
  }
    //detect if there's actual people
  if (button){    
        delay(500);
        if (){
          Firebase.setString("announcement","Authorized");
        //see if the person's authorized, then utilize the servo, and turn on the LED
          if (Firebase.getFloat("announcement") == "Authorized"){
            digitalWrite(servoPin,HIGH);
            digitalWrite(LCDpin,HIGH);
            Firebase.setBool("servo",true);
            delay(30000);
            if (Firebase.getFloat("servo") == true)){
              digitalWrite(MSpin,LOW);
              delay(1000); 
          }
      
    }
  }
}
