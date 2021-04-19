class Rain {

  float rainX;
  float rainY;  
  boolean moveDown;
  float rabbitX;
  float rabbitY;

  Rain() {
    rainX = 350;
    rainY = 0;

    moveDown = true;
  }

  void display() {
    image (rain, rainX, rainY, 40, 50);
  } 

  void drop() {
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
  } 

  void reposition(float rabbitX, float rabbitY) {
    if (rainX < rabbitX + 50 && rainX > rabbitX - 50 && rainY <rainY + 50 && rainY> rabbitY - 50) {
      rainY = 0;
      rainX = random (30, 670);
      moveDown = true;
      countA= countA-1;
    }
  }
}
