class Particle {
  int  colorB;
  float partX, partY, partR;
  // the constructer (birth of the object)
  Particle (float tempX, float tempY, float tempR, int tempC) { // temporal variable giving the constructer to pass it along
    partX = tempX + random(width);
    partY = tempY + random(height);
    partR = tempR * random(6, 12);
    colorB = tempC;
  }

  void ascend() {
    partY = partY +2;
  }

  void top() {
    if (partY > height ) {
      partX = 0;
      partX =  random(width);
      partY =  random(height);
    }
  }

  void display() {
    imageMode(CORNER);
    fill(colorB, 200);
    noStroke();
    ellipse(partX, partY, partR, partR);
    ellipse(partX+10, partY, partR+2, partR+2);
    ellipse(partX+20, partY+6, partR+3, partR+3);
    ellipse(partX+30, partY+2, partR, partR);
  }
}
