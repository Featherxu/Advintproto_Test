//import processing.serial.*;

//Serial myConnection;


float pentio = -1;
float groundLevel;
float button = 0;


//float carrotX = 350;                       //carrot
//float carrotY = 370;                       //carrot

//float rainX = 350;                        //initial rain position
//float rainY = 0;

//float rabbitX = 0;
//float rabbitY = 370;                      //initial rabbit position

float backgroundAX = 0;
float backgroundAY = 0;                    //initial backgroundA position

float backgroundBX = 0;                    //initial backgroundA position
float backgroundBY = 0;  

//boolean moveDown = true;                  //rain starts dropping down
//boolean rabbitDirection = true;
boolean backgroundDirection = true;



int countA = 3;                            //count for life
PFont font;                               //font used for count

PImage rabbit, rabbitRev;
PImage rain;
PImage carrot;
PImage backgroundA;
PImage backgroundB;

ArrayList<Rabbit> rabbits;

ArrayList<Rain> rains;

ArrayList<Carrot> carrots;


void setup() {
  size(600, 600);
  background(#4A53E5);



  rabbit = loadImage ("rabbit.png");      //Rabbit Image 
  rabbitRev = loadImage("rabbitRev.png"); //RabbitRev Image
  rain = loadImage ("rain.png");          //Rain Image
  carrot = loadImage ("carrot.png");      //Carrot Image
  backgroundA = loadImage ("backgroundA.png");
  backgroundB = loadImage("backgroundB.png");
  
  rabbits = new ArrayList<Rabbit>();
  rabbits.add(new Rabbit());
  
  
  rains = new ArrayList<Rain>();
  rains.add(new Rain());


  carrots = new ArrayList<Carrot>();
  carrots.add(new Carrot());

}

void draw() {
  background(#4A53E5);                      //refresh background
  image(backgroundA,backgroundAX, backgroundAY, 600, 600);
  image(backgroundB,backgroundBX, backgroundBY, 600, 600);
  
  textSize(20);
  text("Life:", 50, 50);
  text(countA, 100, 50);

  for (Rabbit r : rabbits) {
    r.display();
    r.rabbitX= mouseX;
  }
  
  
 for (Rain a : rains) {
    a.display();
    a.drop = true;
  }
  
  
 for (Carrot c : carrots) {
    c.display();
    c.carrotY= 410;
  }
  


  //image (rain, rainX, rainY, 40, 50);           //Raindrop Image
  //image(carrot, carrotX, carrotY, 40, 55);        //Carrot Image
  
  

  //if (moveDown == true) {
  //  rainY = rainY +7;
  //}

  //if (rainY <= 650) {
  //  moveDown = true;
  //}

  //if (rainY > 650) {                //let the rain drops
  //  rainY = 0;
  //  rainX = random (30, 670);
  //  moveDown = true;
  //}
  
  
  
  //if(rabbitX <carrotX+25 && rabbitX > carrotX-25 && rabbitY <carrotY+25 && rabbitY>carrotY-25){
  //  carrotX =  random (50,550);
  //  carrotY =  random (200,370);
  //  countA= countA+1;
  //}
  

  
  
  
  
  
  //if (rabbitX > rabbitX-1) {                 //rabbit follows carrot
 
  //  rabbitDirection = true;
  //}

  //if (rabbitX <=rabbitX-1) {            //rabbit follows carrot

  //  rabbitDirection = false;
  //}
  
  if (backgroundAX <=0){
    backgroundAX = backgroundAX - 1;      //backgroundA move right
    backgroundBX = backgroundAX + 600;
    backgroundDirection = true;
  }
  
  if (backgroundBX <=0){
    backgroundBX = backgroundBX - 1;      //backgroundA move right
    backgroundAX = backgroundBX + 600;
    backgroundDirection = true;
  }

 
  
  //if(rabbitDirection == true){
  //  image(rabbit, rabbitX, rabbitY, 100, 100);         //Rabbit Image
  //}
  //else{
  //  image(rabbitRev, rabbitX, rabbitY, 100, 100);       //RabbitRev Image
  //}
  
      

 
  //if (rainX < rabbitX + 50 && rainX > rabbitX - 50 && rainY <rainY + 50 && rainY> rabbitY - 50){
  //  rainY = 0;
  //  rainX = random (30, 670);
  //  moveDown = true;
  //  countA= countA-1;
  //}
  
  //if(countA < 0){
  //  exit();
    

  //}
  }

//void serialEvent(Serial conn){
//  String fromSerial= conn.readString();
  
//  if(fromSerial !=null){
//    fromSerial = trim(fromSerial);
    
//    String[] data = split(fromSerial, ',');
//    printArray(data);
    
//    if(data.length == 2){
      
//      button = float(data[0]);
//      rabbitX = float(data[1]);
//      rabbitX = map(rabbitX, 0, 4096, 0, 500);
    

//  }
// } 

  
 
