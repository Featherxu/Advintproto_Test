float rainX = 350;                        //initial rain position
float rainY = 0;

float rabbitX = 0;
float rabbitY = 370;                      //initial rabbit position

float backgroundAX = 0;
float backgroundAY = 0;                    //initial backgroundA position

float backgroundBX = 0;                    //initial backgroundA position
float backgroundBY = 0;  

boolean moveDown = true;                  //rain starts dropping down
boolean rabbitDirection = true;
boolean backgroundDirection = true;

int countA = 3;                            //count for life
PFont font;                               //font used for count

PImage rabbit, rabbitRev;
PImage rain;
PImage carrot;
PImage backgroundA;
PImage backgroundB;

void setup() {
  size(600, 600);
  background(#4A53E5);

  rabbit = loadImage ("rabbit.png");      //Rabbit Image 
  rabbitRev = loadImage("rabbitRev.png"); //RabbitRev Image
  rain = loadImage ("rain.png");          //Rain Image
  carrot = loadImage ("carrot.png");      //Carrot Image
  backgroundA = loadImage ("backgroundA.png");
  backgroundB = loadImage("backgroundB.png");
}

void draw() {
  background(#4A53E5);                      //refresh background
  image(backgroundA,backgroundAX, backgroundAY, 600, 600);
  image(backgroundB,backgroundBX, backgroundBY, 600, 600);
  
  textSize(20);
  text("Life:", 50, 50);
  text(countA, 100, 50);


  //fill (0, 255, 0);                            //green
  //ellipse (rainX, rainY,50,50);            //raindrop
  image (rain, rainX, rainY, 40, 50);           //Raindrop Image


  //fill(255, 0, 0);                              //red
  //rect(rabbitX, rabbitY, 55, 55, 7);        //rabbit


  //fill(255);                                    //white
  //rect(mouseX,mouseY,20,35);                  //new
  image(carrot, mouseX, mouseY, 40, 55);        //Carrot Image
  
  

  if (moveDown == true) {
    rainY = rainY +7;
  }

  if (rainY <= 650) {
    moveDown = true;
  }

  if (rainY > 650) {                //let the rain drops
    rainY = 0;
    rainX = random (30, 670);
    moveDown = true;
  }
  
  //fill(255, 0, 0);                  //red dot (delete later)
  //circle(rabbitX+50, rabbitY, 10);    //red dot (delete later)
  
  if (mouseX>rabbitX+50) {                 //rabbit follows carrot
    rabbitX = rabbitX + 4;
    rabbitDirection = true;
  }

  if (mouseX <=rabbitX+50) {            //rabbit follows carrot
    rabbitX = rabbitX - 4;
    rabbitDirection = false;
  }
  
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

  if (rabbitX <= 0) {              //rabbit not go out of wall
    rabbitX = rabbitX + 4;
  }

  if (rabbitX >= 500) {          //rabbit not go out of wall
    rabbitX = rabbitX - 4;
  }
  
  if(rabbitDirection == true){
    image(rabbit, rabbitX, rabbitY, 100, 100);         //Rabbit Image
  }
  else{
    image(rabbitRev, rabbitX, rabbitY, 100, 100);       //RabbitRev Image
  }
  
      

  //if (rainY >370 && rainX < rabbitX + 30 ) {    //this doesn't work
  //if (rabbitX < rainX + 50 && rabbitX > rainX - 50 && rabbitY <rabbitY + 50 && rabbitY> rainY - 50){
  if (rainX < rabbitX + 50 && rainX > rabbitX - 50 && rainY <rainY + 50 && rainY> rabbitY - 50){
    rainY = 0;
    rainX = random (30, 670);
    moveDown = true;
    countA= countA-1;
  }
  
  if(countA < 0){
    exit();
  }
  }
