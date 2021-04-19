import processing.serial.*;

Serial myConnection;

float potentio = 1;
//float pentio = -1;
float button = 0;

float groundLevel;
//float rabbitX;
float carrotX;
//float rabbitY;
float carrotY;
float rainX;
float rainY;


//float up;                              //these four line from demo
//float down;
float gravity = 0.5;
float ground = 400;


float backgroundAX = 0;
float backgroundAY = 0;                    //initial backgroundA position

float backgroundBX = 0;                    //initial backgroundA position
float backgroundBY = 0;  

boolean moveDown = true;                  //rain starts dropping down
//boolean rabbitDirection = true;
boolean backgroundDirection = true;



int countA = 3;                            //count for life
PFont font;                               //font used for count

PImage rain;
PImage carrot;
PImage backgroundA;
PImage backgroundB;

Rabbit myRabbit;

ArrayList<Rain> rains;

ArrayList<Carrot> carrots;


void setup() {
  size(600, 600);
  background(#4A53E5);




  rain = loadImage ("rain.png");          //Rain Image
  carrot = loadImage ("carrot.png");      //Carrot Image
  backgroundA = loadImage ("backgroundA.png");
  backgroundB = loadImage("backgroundB.png");

 myRabbit = new Rabbit(370,0);


  rains = new ArrayList<Rain>();
  rains.add(new Rain());


  carrots = new ArrayList<Carrot>();
  carrots.add(new Carrot());


  printArray(Serial.list());
  myConnection = new Serial(this, Serial.list()[3], 9600);
  myConnection.bufferUntil('\n');
}

void draw() {
  background(#4A53E5);                      //refresh background
  image(backgroundA, backgroundAX, backgroundAY, 600, 600);
  image(backgroundB, backgroundBX, backgroundBY, 600, 600);

  textSize(20);
  text("Life:", 50, 50);
  text(countA, 100, 50);


    myRabbit.updateRabbit(370, 1);
    //myRabbit.buttonPressed();
    //myRabbit.buttonReleased();
    myRabbit.display();
    //r.rabbitX= mouseX;



  for (Rain a : rains) {
    a.display();
    a.drop();
    a.reposition(myRabbit.position.x, myRabbit.position.y);
  }


  for (Carrot c : carrots) {
    c.display();
    c.reposition(myRabbit.position.x, myRabbit.position.y);
    //c.carrotY= 410;
  }



  //image (rain, rainX, rainY, 40, 50);           //Raindrop Image
  //image(carrot, carrotX, carrotY, 40, 55);        //Carrot Image







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

  if (backgroundAX <=0) {
    backgroundAX = backgroundAX - 1;      //backgroundA move right
    backgroundBX = backgroundAX + 600;
    backgroundDirection = true;
  }

  if (backgroundBX <=0) {
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


  if (countA < 0) {
    exit();
  }
}

void serialEvent(Serial conn) {
  String fromSerial= conn.readString();

  if (fromSerial !=null) {
    fromSerial = trim(fromSerial);

    String[] data = split(fromSerial, ',');
    printArray(data);

    if (data.length == 2) {

      button = float(data[0]);
      potentio = float(data[1]);
      //rabbitX = map(rabbitX, 0, 4096, 0, 500);
    }
  }
}
