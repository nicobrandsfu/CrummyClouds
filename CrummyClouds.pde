//---  LIBARIES  ---

import processing.sound.*;

//---  OBJECTS  ---
SoundFile file;
Baloon baloon1;

Particle p1;
Text t1;


//---  INITIALYZE VARIABLES  ---
int x;

PImage[] cloud = new PImage[9];
PImage baloonCharacter;
color brightBlue, darkBlue, brightYellow, darkYellow;
PFont font;

Cloud[] clouds = new   Cloud[5];
Particle[] particles = new Particle[16];

boolean callLifeLoose = false;

//---  INITIALYZE & SET VALUES  ---
float baloonW = 230;
float baloonH = 400;

float hitBoxW = 180;
float hitBoxH = 200;

float speedClouds = 14;

int counter = 1;
int lifes = 0;
int endLifes = 0;

//---  SETUP  ---

void setup() {
  size(1200, 800);
  smooth();
  noCursor();
  frameRate(60);

  // SOUNDS 
  //file = new SoundFile(this, "rawr.mp3");

  // TEXT
  t1 = new Text();

  // PARTICLES
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(10+20, 10, 2, color(#e0e1dd) );
  }

  // BALOON
  baloonCharacter = loadImage("baloon.png");
  baloon1 = new Baloon(mouseX, mouseY, 230, 400, baloonCharacter);

  // CLOUDS
  for (int i = 0; i < cloud.length; i++) {
    cloud[i] = loadImage("cloud_"+i+".png");
  }
  for (int i = 0; i < clouds.length; i++) {
    int index = int(random(0, cloud.length));
    clouds[i] = new Cloud(0, 0, 140, 110, color(12, 45, 230), cloud[index], speedClouds);
  }
}


//---  DRAW  ---

void draw() { 

  if (lifes >= 50) {
    gameOver();
  } else {


    // BACKGROUND
    background(#0066e0);
    fill(#ffed43);

    // DRAW UI
    font = createFont("SpaceGrotesk-SemiBold.otf", 30);
    textSize(30);
    textFont(font);
    textAlign(LEFT);
    text("Score: "+frameCount, 40, 100);
    text("Hits: "+lifes+" /50", 40, 140);


    // DRAW PARTICLES
    for (int i = 0; i < particles.length; i++) {
      particles[i].display();
      particles[i].ascend();
      particles[i].top();
    }
    baloon1.display();

    // DRAW CLOUDS
    for (int i = 0; i < clouds.length; i++) {
      clouds[i].display();
      clouds[i].ascend();
      clouds[i].top();
      clouds[i].overlaps1();
      // DRAW UI IF BALOON GETS HIT
      if (clouds[i].overlaps1() == true) {
        background(#e22c1a);
        t1.display();
        callLifeLoose = true;
      }
    }

    if (callLifeLoose) {
      addHitt();
      callLifeLoose = false;
    }
  }
}

//---  FUNCTIONS  ---

void addHitt () {
  lifes = lifes + counter;
}

// Game over
void gameOver() {
  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  fill(#140202, 210);
  rect(0, 0, 1600, 1400);
  font = createFont("SpaceGrotesk-SemiBold.otf", 300);
  textFont(font);
  fill(#FF462F);
  textAlign(CENTER);
  textSize(160);
  text("GAME OVER", width/2, height/2);
  textSize(24);
  text("Press space for replay", width/2, height/2+100);

  if (keyPressed == true) {
    lifes = 0;
  }
}
