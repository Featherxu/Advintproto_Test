import processing.serial.*;

Serial myConnection;

int barWidth = 20;
int lastBar = -1;

float max_distance;
float pentio = 40;
float circleHue = 0;
float bgBright = 0;


void setup() {
  size(1480, 800); 
  
  colorMode(HSB, 360, 100, 100);
  
  printArray(Serial.list());
  myConnection = new Serial(this, Serial.list()[3], 9600);
  myConnection.bufferUntil('\n');

  noStroke();
  max_distance = dist(0, 0, width, height);
  
}

void draw(){
    background(0, 0, bgBright);

  
  fill(circleHue, 100, 100);
   
   int whichBar = mouseX / barWidth;
   if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
   // fill(mouseY, height, height);

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
  
  if(fromSerial !=null){
    fromSerial = trim(fromSerial);
    
    String[] data = split(fromSerial, ',');
    printArray(data);
    
    if(data.length == 2){
      
      bgBright = float(data[0]);
      bgBright = map(bgBright, 1000, 2000, 0, 100);
      
      circleHue = float(data[1]);
      circleHue = map(circleHue, 0, 4096, 0, 360);
    

  }
 } 

  
  println(fromSerial);
}
