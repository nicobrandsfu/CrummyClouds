class Text {

  PFont font;

  Text () {

    // The font must be located in the sketch's 
    // "data" directory to load successfully
    font = createFont("SpaceGrotesk-SemiBold.otf", 120);
    textFont(font);
  }

  void display () {
    fill(255);
    textAlign(CENTER);
    textSize(160);
    text("+Hit", width/2+4, height/2+120);
    textSize(60);
    text("Ouuuch", width/2+32, height/2+220);
  }
}
