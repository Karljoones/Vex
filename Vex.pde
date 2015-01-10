//     Vex
//    -----
// Karl Jones

import ddf.minim.*;
Minim minim;

// Class files init
Screens screen;
Player player;
Load load;
levelGen generation;
Menu collision;
Particle ps;
Collision pCollision;

// Booleans
boolean mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false;

// User defined options
boolean musicOPT = false, SFXOPT = true, debugging = true;

// Level
PVector line1_start, line1_end, line2_start, line2_end, line3_start, line3_end, line4_start, line4_end, line5_start, line5_end, line6_start, line6_end, line7_start, line7_end, line8_start, line8_end;

// Player related variables
PVector playerPos;
int playerScore, playerCoins, playerSize = 50;
boolean movingRight = false, movingLeft = false;
float[] playerBoundaries = new float[8];

// Fonts
PFont mainMenuFont, playerStatsDisplay, instructions;

// Images
PImage logo;

// Misc
int buttonWidth = 310, buttonHeight = 90; 
int i = 0, lineMin = 400, lineMax = 2000, verticalMin = -200, verticalMax = 200;

// Music and sound effects of the game.
AudioPlayer mainMenuMusic, selectKey, themeSong;

// These are for control over the sine wave in the main menu.
float theta = 0.0, amplitude = 75.0, period = 500.0, dx, spacing = 16;
int w;
float[] yvalues;

void setup() {
 size(displayWidth, displayHeight);
 frame.setResizable(true); 
 frameRate(180);
 
 // Initialise classes
 screen = new Screens();
 load = new Load();
 player = new Player();
 generation = new levelGen();
 collision = new Menu();
 ps = new Particle();
 pCollision = new Collision();
 
 minim = new Minim(this);
 
 load.loadFonts();
 load.loadImages();
 load.loadMusic();
 load.loadSounds();
 
 playerPos = new PVector(width / 2, height / 2 + 200);
 
 if(musicOPT){
   mainMenuMusic.loop();
 }
 
 // Sine wave control
 w = width + 16;
 dx = (TWO_PI / period) * spacing;
 yvalues = new float[int(w/spacing)];
 
 pCollision.checkPlayerBoundaries();
}

void draw() {
  background(0); 
  println(frameRate);
  
  if(mainMenu) {
    if(musicOPT) {
      if(!mainMenuMusic.isLooping()){
        mainMenuMusic.loop();
      }
    }
    
    collision.mainMenu();
    screen.mainMenu();
  }
  
  if(instructionsScreen) {
    screen.instructionsScreen();
  }
  
  if(play) {
    screen.game();
    player.move();
    player.update();
    generation.platforms();
    generation.check();
    
    if(musicOPT) {
      if(!themeSong.isLooping()) {
        themeSong.loop();
      }
    }
  }
  
  if(options) {
    collision.options();
    screen.options();
  }
  
} // End draw



