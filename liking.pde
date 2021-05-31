import processing.serial.*;
import processing.sound.*;

SoundFile canc;
SoundFile hosp;

Serial mySerial;
String myString = null;
int nl= 10;
float myVal;

float vol=0;

float x=0;

float y=1;


void setup() {
  size(200, 400);

  String myPort = Serial.list()[2]; 
  mySerial =new Serial(this, myPort, 9600);

  canc = new SoundFile(this, "morado.mp3");

  hosp = new SoundFile(this, "rojo.mp3");

  canc.amp(vol);
  canc.play();
  canc.loop();

  hosp.amp(vol);
  hosp.play();
  hosp.loop();
}

void draw() {  
  while (mySerial.available() > 0) {
    myString= mySerial.readStringUntil(nl);

    if (myString!=null) {
      background(0);

      myVal = float(myString);

      println(myVal);

      if (myVal==1.0) {
        vol=vol+0.05;
        canc.amp(vol);
        hosp.amp(1-0-vol);
      } else if (myVal==0.0) {
        vol=vol-0.05;
        canc.amp(vol);
        hosp.amp(1-0-vol);
      } else if (myVal==2.0) {
        vol=0.0;
        canc.amp(vol);
        hosp.amp(vol);
      }

      if (vol>1.0) {
        vol=1.0;
      } else if (vol<0.0) {
        vol=0.0;
      }
    }
  }
}
