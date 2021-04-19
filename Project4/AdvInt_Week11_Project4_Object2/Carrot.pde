class Carrot {

  float carrotX;                       //carrot
  float carrotY;        
  float position;
  //float countA;
 
  

  Carrot() {
  carrotX = 350;
  carrotY = 400;
  }


  void display(){
      image(carrot, carrotX, carrotY, 40, 55);  }    
    
    
  void reposition(float rabbitX, float rabbitY){
    if (carrotX < rabbitX + 50 && carrotX > rabbitX - 50 && carrotY <carrotY + 50 && carrotY> rabbitY - 50) {
    carrotX =  random (50,550);
    carrotY =  random (300,370);
    countA= countA+1;
 }
  

    
    
    
  //if(rabbitX <carrotX+25 && rabbitX > carrotX-25 && rabbitY <carrotY+25 && rabbitY>carrotY-25){
  //  carrotX =  random (50,550);
  //  carrotY =  random (200,370);
  //  countA= countA+1;
  //}
     
    
    
    
  }
  
  
}
