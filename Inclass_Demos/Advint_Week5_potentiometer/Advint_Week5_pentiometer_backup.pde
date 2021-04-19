import processing.serial.*;

Serial myConnection;

int barWidth = 20;
int lastBar = -1;

float max_distance;
float pentio = 0;

void setup() {
  size(600, 600); 
  
  printArray(Serial.list());
  myConnection = new Serial(this, Serial.list()[3], 9600);
  myConnection.bufferUntil('\n');


  noStroke();
  max_distance = dist(0, 0, width, height);
  colorMode(HSB, height, height, height);  
}

void draw() {
  background(0);
   
   int whichBar = mouseX / barWidth;
   if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(mouseY, height, height);

  for(int i = 0; i <= width; i += 20) {
    for(int n = 0; n <= height; n += 20) {
      float size = dist(mouseX, mouseY, i, n);
      size = size/max_distance * pentio;
      ellipse(i, n, size, size);
   }
  }
 }
}

void serialEvent(Serial conn){
  String fromSerial= conn.readString();
  
  pentio= float(fromSerial);
  //pentio = constrain(pentio,30,width);
  pentio = map(pentio,0,4096,30,width);
  
  println(fromSerial);
}
