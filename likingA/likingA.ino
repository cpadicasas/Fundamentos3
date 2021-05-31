#include <CapacitiveSensor.h>

#define REDPIN 5
#define GREENPIN 9
#define BLUEPIN 3

CapacitiveSensor   cs_4_2 = CapacitiveSensor(4, 6);     
void setup()
{

  cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF);     
  Serial.begin(9600);
  pinMode(REDPIN, OUTPUT);
  pinMode(GREENPIN, OUTPUT);
  pinMode(BLUEPIN, OUTPUT);

}

void loop()
{

  long total1 =  cs_4_2.capacitiveSensor(30);
  int r, g, b;
  //Serial.println(total1);
  
  if (total1>= 75 && total1<= 300) {
    // fade from blue to violet
     analogWrite(REDPIN,150);
      analogWrite(GREENPIN, 0);
      analogWrite(BLUEPIN, 160);
    Serial.println(1.0); 
 
  } 
  
  if (total1 > 305){
    
    analogWrite(REDPIN,205);
      analogWrite(GREENPIN, 0);
      analogWrite(BLUEPIN, 0);
      Serial.println(0.0); 
  }
 if (total1 <60){
  analogWrite(REDPIN,255);
      analogWrite(GREENPIN, 255);
      analogWrite(BLUEPIN, 255);
      Serial.println(2.0); 
  }
  
  }
 
