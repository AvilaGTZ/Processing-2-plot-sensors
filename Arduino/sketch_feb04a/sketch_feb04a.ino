
int state = 5;
int sensor = 0;
int finish = 0;

const int analogInPin = A0;
const int analogInPinB = A1;

int sensorValue = 0;        // Read  A0
int sensorValueB = 0;       // Read  A1

void setup() 
{
  delay(500);
  Serial.begin(9600);
  
}

void loop()
{
  
  state = Serial.read();
  while(state == 48)
  {
    
    //int variableA = int(map(sensorValue, 0, 1023, 0, 275));
    //int variableB = int(map(sensorValueB, 0, 1023, 0, 275));
    
    sensor = Serial.read();
    
    if(sensor == 49);
    {
      sensorValue = analogRead(analogInPin);                       //Read first sensor
      int variableA = int(map(sensorValue, 0, 1023, 0, 275));      //Mapping to 275, because it is the range of the processing plot, from 0 to 275
      //Serial.print("SENSOR_ONE");
      Serial.println(variableA);                                   //Send data over usart
      delay(200);                                                  //Delay in order that GUI process the next data

      sensorValueB = analogRead(analogInPinB);                     //Read second sensor
      int variableB = int(map(sensorValueB, 0, 1023, 0, 275));     //Mapping to 275, because it is the range of the processing plot, from 0 to 275
      //Serial.print("SENSOR _TWO");
      Serial.println(variableB);                                   //Send data over usart
      delay(200);
       
    }
    
  }

}
