
import processing.serial.*;
Serial myPort;
String myString = null;
String myStringB = null ;
String estado = null;

int nl = 10;
float level = 0;         //Variable for serial reading
float resta = 0;         //Variable for level calculation

float levelB = 0;         //Variable for serial reading
float restaB = 0;         //Variable for level calculation

void setup()
{
  size (300, 330);  //Generamos nuestra ventana
  smooth();
  
  myPort = new Serial(this,Serial.list()[0],9600);     //Microcontroller port configuration
 
  
}

// SE DIBUJAN LOS NIVELES -------------------------------------------------------
void draw() 
{
  myPort.write(48);                       //Send 48 (zero) To start reading from MCU
  
  while(myPort.available() > 0)
  {
  
  
  myPort.write(49);   //Send "1" to recieve the first reading value
  
  myString = myPort.readStringUntil(nl);
  if(myString != null)
  {
  level = float(myString);
  resta = 275 - level;                    //Calculate the vale for the first sensor
  myString = null;
  }
  
  background(0);                          //Set black background
  fill(200);
  textSize(20);
  text("Sensor A",30, 300);
  rect(30, 20, 80, 255, 7);
  fill(32,178,170);
  rect(30, resta, 80, level, 7);          //Plot the first sensor
  println(resta + 'A');
  
  delay(200);
  
  //myPort.write(50);                       //Send "2" to recieve the second reading value
  
  myStringB = myPort.readStringUntil(nl);
  if(myStringB != null)
  {
  levelB = float(myStringB);
  restaB = 275 - levelB;                  //Calculate the vale for the second sensor
  myStringB = null;
  }
  //delay(500);
  
  
  fill(200);
  textSize(20);
  text("Sensor B",185, 300);
  rect(185, 20, 80, 255, 7);
  fill(255,0,0);
  rect(185, restaB, 80, levelB, 7);       //Plot the second sensor
  println(restaB + 'B');
  }
  
}