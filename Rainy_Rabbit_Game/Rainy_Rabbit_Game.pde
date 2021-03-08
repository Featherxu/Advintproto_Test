float rainX = 350;                        //initial rain position
float rainY = 0;

float rabbitX = 0;
float rabbitY = 500;                      //initial rabbit position

boolean moveDown = true;                  //rain starts dropping down


int countA = 3;                            //count for life
PFont font;                               //font used for count

PImage rabbit;
PImage rain;
PImage carrot;


void setup(){
  size(600,600);
  background(#4A53E5);
  
  rabbit = loadImage ("rabbit.png");      //Rabbit Image 
  rain = loadImage ("rain.png");          //Rain Image
  carrot = loadImage ("carrot.png");      //Carrot Image
}

void draw(){
  background(#4A53E5);                      //refresh background
 
  textSize(20);
  text("Life:", 50, 50);
  text(countA, 100, 50);
  
 
  fill (0,255,0);                            //green
  image (rain,rainX, rainY,40,50);           //Raindrop Image
  //ellipse (rainX, rainY,50,50);            //raindrop
  
  
  fill(255,0,0);                              //red
  image(rabbit, rabbitX, rabbitY, 100, 100);    //Rabbit Image
  //rect(rabbitX, rabbitY, 55, 55, 7);        //rabbit
  
  
  fill(255);                                    //white
  //rect(mouseX,mouseY,20,35);                  //new
  image(carrot, mouseX, mouseY, 40, 55);        //Carrot Image
  
  if(moveDown == true){
  rainY = rainY +7;
  }
  
  if(rainY <= 650){
  moveDown = true;
  }
  
   if(rainY > 650){                //let the rain drops
   rainY = 0;
   rainX = random (30,670);
   moveDown = true;
  }
  
  if (mouseX>300){                 //rabbit follows carrot
    rabbitX = rabbitX + 4;
  }
  
   if (mouseX <= 300){            //rabbit follows carrot
    rabbitX = rabbitX - 4;        
  }
  
   if (rabbitX <= 0){              //rabbit not go out of wall
    rabbitX = rabbitX + 4;
  }
  
    if (rabbitX >= 500){          //rabbit not go out of wall
    rabbitX = rabbitX - 4;
  }
   
  if (rainY >550 && rainX < rabbitX + 30){    //this doesn't work
    rainY = 0;
    rainX = random (30,670);
    moveDown = true;
    countA= countA-1;
  }
 
}
