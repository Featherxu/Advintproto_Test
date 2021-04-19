class Rabbit {
  
  PImage rabbitImg = loadImage ("rabbit.png");
  PImage rabbitRevImg = loadImage("rabbitRev.png");
  PVector position;
  float direction;
  PVector velocity;
  float jumpSpeed = 15;
  
  boolean rabbitDirection;
  

  boolean up = false;
  boolean down = false;
  
  float gravity = 1;
  float ground = 370;


  Rabbit(float rX, float rY) {
    //rabbitX = 0;
    //rabbitY = 370;
    rabbitDirection = true;


    position = new PVector (rX, rY);
    velocity = new PVector (10, 10);
  }

  void display() {
    
    position.x = map(potentio, 0, 4096, 0, 500);
    
    
    
    if (rabbitDirection == true) {
      image(rabbitImg, position.x, position.y, 100, 100);
    } else {
      image(rabbitRevImg, position.x, position.y, 100, 100);
    }
 
 
    
 
  }


  void updateRabbit(float ground, float gravity)
  {
    if (myRabbit.position.y < ground)
    {
      myRabbit.velocity.y += gravity;
    } else
    {
      myRabbit.velocity.y = 0;
    }

    if (myRabbit.position.y >= ground && up == true)
    {
      myRabbit.velocity.y = -myRabbit.jumpSpeed;
    }


    PVector nextPosition = new PVector(myRabbit.position.x, myRabbit.position.y);
    //PVector nextPosition = new PVector(0,0);
    nextPosition.add(myRabbit.velocity);

    float offset = 0;

    if (nextPosition.y > offset && nextPosition.y < (600 - offset))
    {
      myRabbit.position.y = nextPosition.y;
    } 
    


  //void buttonPressed() {
    if (button == 1) {
      up = true;
      //position.y = position.y-1;
      
    }
  //}

  //void buttonReleased() {
    if (button == 0 ) {
      up = false;
      //position.y = position.y;
    }
  //}
 }


}
