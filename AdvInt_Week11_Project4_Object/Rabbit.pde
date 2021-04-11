class Rabbit {

  float rabbitX;
  float rabbitY;    
  boolean rabbitDirection;

  Rabbit() {
    rabbitX = 0;
    rabbitY = 370;

    rabbitDirection = true;
  }

  void display() {
    if (rabbitDirection == true) {
      image(rabbit, rabbitX, rabbitY, 100, 100);
    } else {
      image(rabbitRev, rabbitX, rabbitY, 100, 100);
    }
  }
  
 

  
}






  
 
  //if (rainX < rabbitX + 50 && rainX > rabbitX - 50 && rainY <rainY + 50 && rainY> rabbitY - 50){
  //  rainY = 0;
  //  rainX = random (30, 670);
  //  moveDown = true;
  //  countA= countA-1;
  //}
