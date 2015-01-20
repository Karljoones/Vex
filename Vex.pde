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
Collision pCollision;
Enemy enemy;

// Booleans for the splash screens and options
boolean mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false, powerUpScreen = false;
boolean musicOPT = false, SFXOPT = true, debugging = true;

// Level variables
PVector line1_start, line1_end, line2_start, line2_end, line3_start, line3_end, line4_start, line4_end, line5_start, line5_end, line6_start, line6_end, line7_start, line7_end, line8_start, line8_end;
final int lineMin = 400, lineMax = 2000, verticalMin = -200, verticalMax = 200, buttonWidth = 310, buttonHeight = 90;
final float gravity = 0.5;

// Player related variables
PVector playerPos, velocity;
int playerScore = 0, playerCoins, playerSize = 50;
boolean holdingRight, holdingUp = false;
float[] playerBoundaries = new float[8];
float curSpeed;


// Player upgrades to be unlocked by the player.
boolean speed1B = false, speed2B = true, speed3B = false;
final float speed1 = 1.2, speed2 = 1.4, speed3 = 1.6;
boolean jump1B = false, jump2B = false;
final float jump1 = 1.2, jump2 = 1.3;
final int speed1Cost = 4000, speed2Cost = 5500, speed3Cost = 10000, jump1Cost = 5000, jump2Cost = 10000; // Costs need to be added when points system is added to the game.

// Fonts
PFont mainMenuFont, playerStatsDisplay, instructions, upgradeWindowFont;

// Misc
int i = 0, halfWidth, halfHeight;

// Music and sound effects of the game.
AudioPlayer mainMenuMusic, selectKey, themeSong;

// Sine wave control
float theta = 0.0, amplitude = 75.0, period = 500.0, dx, spacing = 16;
int w;
float[] yvalues;

// Power up screen variables
int windowWidthL, windowHeightL, windowWidthS, windowHeightS;

void setup() {
 size(displayWidth, displayHeight);
 frame.setResizable(true); 
 frameRate(60);
 
 halfWidth = width / 2;
 halfHeight = height / 2;
 // Initialise classes
 screen = new Screens();
 load = new Load();
 player = new Player();
 generation = new levelGen();
 enemy = new Enemy();
 collision = new Menu();
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
 
 playerPos = new PVector(40, 200);
 
 pCollision.checkPlayerBoundaries();
 
 windowWidthL = width - 200;
 windowHeightL = height - 200;
 windowWidthS = windowWidthL / 4;
 windowHeightS = windowHeightL - 200;
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



