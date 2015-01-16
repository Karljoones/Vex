//     Vex
//    -----
// Karl Jones

import ddf.minim.*;
Minim minim;

// Class files initialisation
Screens screen;
Player player;
Load load;
levelGen generation;
Menu collision;
Particle ps;
Collision pCollision;
Enemy enemy;

// Booleans for the splash screens and options
boolean mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false, powerUpScreen = false;
boolean musicOPT = false, SFXOPT = true, debugging = true;

// Level
PVector line1_start, line1_end, line2_start, line2_end, line3_start, line3_end, line4_start, line4_end, line5_start, line5_end, line6_start, line6_end, line7_start, line7_end, line8_start, line8_end;
final int lineMin = 400, lineMax = 2000, verticalMin = -200, verticalMax = 200, buttonWidth = 310, buttonHeight = 90;
final float gravity = 0.5;

// Player related variables
PVector playerPos, velocity;
int playerScore, playerCoins, playerSize = 50;
boolean holdingRight, holdingUp = false;
float[] playerBoundaries = new float[8];

// PLayer upgrades to be unlocke
boolean speed1B = false, speed2B = false, speed3B = false;
final float speed1 = 1.2, speed2 = 1.4, speed3 = 1.6;
boolean jump1B = false, jump2B = false;
final float jump1 = 1.2, jump2 = 1.3;

// Fonts
PFont mainMenuFont, playerStatsDisplay, instructions;

// Images
PImage logo;

// Misc
int i = 0;

// Music and sound effects of the game.
AudioPlayer mainMenuMusic, selectKey, themeSong;

// These are for control over the sine wave in the main menu.
float theta = 0.0, amplitude = 75.0, period = 500.0, dx, spacing = 16;
int w;
float[] yvalues;

void setup() {
 size(displayWidth, displayHeight);
 frame.setResizable(true); 
 frameRate(60);
 
 // Initialise classes
 screen = new Screens();
 load = new Load();
 player = new Player();
 generation = new levelGen();
 enemy = new Enemy();
 collision = new Menu();
 ps = new Particle();
 pCollision = new Collision();
 
 minim = new Minim(this);
 
 load.loadFonts();
 load.loadImages();
 load.loadMusic();
 load.loadSounds();
 
 if(musicOPT){
   mainMenuMusic.loop();
 }
 
 // Sine wave control
 w = width + 16;
 dx = (TWO_PI / period) * spacing;
 yvalues = new float[int(w/spacing)];
 
 playerPos = new PVector(40, 600);
 
 // This only needs to be run once as the player does not move.
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
  } // End if(mainMenu)
  
  if(instructionsScreen) {
    screen.instructionsScreen();
  } // End if(instructinosScreen)
  
  if(play) {
    screen.game();
    player.play();
    generation.work();
    // enemy.enemyGeneration("enemyType");
    
    println("isOnGround() = " + pCollision.isOnGround());
    if(musicOPT) {
      if(!themeSong.isLooping()) {
        themeSong.loop();
      }
    }
  } // End if(play)
  
  if(options) {
    collision.options();
    screen.options();
  } // End if(options)
  
} // End draw

void keyPressed() {
  if(play){
    if(keyCode == RIGHT) {
      holdingRight = true;
    }
    if(keyCode == UP) {
      if(pCollision.isOnGround()){
        holdingUp = true;
      }
    }
    if(key == 'p' || key == 'P') {
      powerUpScreen = !powerUpScreen;
    }
  } // End if(play)
} // End keyPressed()

void keyReleased() {
  if(play) {
    if(keyCode == RIGHT) {
      holdingRight = false;
    }
    if(keyCode == UP) {
      holdingUp = false;
    }
    if(key == 'm' || key == 'M'){
      mainMenu = true;
      play = false;
    }
  } // End if(play)
} //End keyReleased()



