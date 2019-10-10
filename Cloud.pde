class Cloud {
  float rectW, rectH, rectX, rectY, hitBoxCloudX, hitBoxCloudY, hitBoxCloudW, hitBoxCloudH, speed;
  int colorB;
  PImage img;
  int[] cloudPosY = {  20, 150, 280, 410, 540, 670, 800, 930, 1060}; 
  int[] cloudPosX = { 20, 150, 280, 410, 540, 670, 800, 930, 1060}; 

  // the constructer (birth of the object)
  Cloud (float tempX, float tempY, int tempW, int tempH, int tempC, PImage tempImg, float tempS) { // temporal variable giving the constructer to pass it along
    int indexX = int(random(cloudPosY.length));
    //int indexY = int(random(cloudPosX.length));
    rectX = tempX + cloudPosY[indexX];
    rectY = tempY + random(height);
    rectW = tempW;
    rectH = tempH;
    colorB = tempC;
    img = tempImg;
    speed = tempS;

    hitBoxCloudX = rectX;
    hitBoxCloudY = rectY; 
    hitBoxCloudW = rectW-15;
    hitBoxCloudH = rectH-15;
  }

  Cloud() {
    rectX = width;
    rectY = height;
    rectW = 10;
    rectH = 10;
    colorB = color(0);
  }

  void ascend() {
    rectY = rectY + 1 *speed;
    println(rectY);
  }

  void top() {
    if (rectY > height + rectW) {
      rectY = 0;
      int indexX = int(random(cloudPosY.length));
      rectX = cloudPosY[indexX];
    }
  }

  boolean overlaps1() {

    if (mouseX + hitBoxW > rectX && mouseX < rectX + rectW && mouseY + hitBoxH > rectY && mouseY < rectY + rectH ) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    //fill(0, 0, 255, 200);
    noFill();
    rectMode(CORNER);
    rect(hitBoxCloudX, hitBoxCloudY, hitBoxCloudW, hitBoxCloudH);
    imageMode(CORNER);
    image(img, rectX, rectY, rectW, rectH);
  }
}
