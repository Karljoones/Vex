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

boolean mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false, powerUpScreen = false, characterSelection = false;
boolean musicOPT = false, SFXOPT = true, debugging = true;

// Level variables and menu variables
PVector line1_start, line1_end, line2_start, line2_end, line3_start, line3_end, line4_start, line4_end, line5_start, line5_end, line6_start, line6_end, line7_start, line7_end, line8_start, line8_end;
final int lineMin = 400, lineMax = 2000, verticalMin = -200, verticalMax = 200, buttonWidth = 310, buttonHeight = 90;
final float gravity = 0.5;

// Player related variables
PVector playerPos, velocity;
int playerScore = 1000, playerCoins, playerSize = 50;
boolean holdingRight, holdingUp = false;
float[] playerBoundaries = new float[8];

// Avatar variables
boolean avatar1 = true, avatar2 = false, avatar3 = false; // Only one can be true at any one time
boolean avatar1Unlocked = true, avatar2Unlocked = false, avatar3Unlocked = false; // Avatar 1 is always unlocked
final int avatar2Cost = 1000, avatar3Cost = 1250; 

// Player upgrades to be unlocked by the player.
boolean speed1B = false, speed2B = false, speed3B = false, jump1B = false, jump2B = false;
final float speed1 = 1.2, speed2 = 1.4, speed3 = 1.6, jump1 = 1.2, jump2 = 1.3;
final int speed1Cost = 1000, speed2Cost = 1500, speed3Cost = 2500, jump1Cost = 1000, jump2Cost = 1500; // Costs may need to be balanced out in the game.

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
    collision.play();
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
      characterSelection = false;
    }
    if(key == 'c' || key == 'C') {
      characterSelection = !characterSelection;
      powerUpScreen = false;
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



