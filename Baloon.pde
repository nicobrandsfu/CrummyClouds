class Baloon {

  float baloontW, baloonH, baloonX, baloonY;
  PImage img;
  //float yMap = map(mouseY, 0, 800, 500, 800);

  // the constructer (birth of the object)
  Baloon ( int tempX, int tempY, int tempW, int tempH, PImage tempImg) { // temporal variable giving the constructer to pass it along
    baloonX = tempX;
    baloonY = tempY;
    baloonW = tempW;
    baloonH = tempH;
    img = tempImg;
  }

  void display() {
    imageMode(CORNER);
    //rect(mouseX - (baloonW/2), mouseY- (baloonH/2), baloonW, baloonH);
    //image(img, mouseX - (baloonW/2), mouseY - (baloonH/2), baloonW, baloonH);
    translate(-baloonW/2, -baloonH/2);
    image(img, mouseX, mouseY, baloonW, baloonH);
    translate(30, 20); // difference of baloonW & hitboxW = 60 -> (60/2) = 30 //    fill(0, 255, 0);
    // fill(0, 255, 0, 100);
    noFill();
    noStroke();
    rect(mouseX, mouseY, hitBoxW, hitBoxH);
  }
}
