// VEX

//Controls
//
//Up to jump
//Right & Left arrows to move side to side
//P to exit to main menu.

import ddf.minim.*;

Minim minim;

// Class files init
Screens screen;
Player player;
Load load;
levelGen generation;
Collision collision;
Particle ps;

// Booleans
boolean mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false;

// User defined options
boolean musicOPT = true, SFXOPT= true, debugging = true;

// Level walls and platforms
PVector line1_start, line1_end, line2_start, line2_end, line3_start, line3_end, line4_start, line4_end, line5_start, line5_end, line6_start, line6_end;
boolean lineOrientation = true;

//// Player variables
PVector playerPos;
int playerScore, playerLives;

// Fonts
PFont mainMenuFont, playerStatsDisplay;

// Images
PImage startScreen;

// Misc
int buttonWidth = 310, buttonHeight = 90; // These values are used for all of the menus in the game.
int i = 0;

void setup() {
 size(displayWidth, displayHeight);
 frame.setResizable(true); 
 
 // Initialise classes
 screen = new Screens();
 load = new Load();
 player = new Player();
 generation = new levelGen();
 collision = new Collision();
 ps = new Particle();
 
 minim = new Minim(this);
 
 // These two functions load all the files amnd initialise the game for the player to be able to play
 load.loadFonts();
 load.loadImages();
 load.loadVectors();
 load.loadMusic();
 load.loadSounds();
 
 // Set the players initial spawn in the world
 playerPos = new PVector(width / 2, height / 2);
 
}

void draw() {
  background(0); 
  println(frameRate);
  
  if(mainMenu) {
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
    generation.check();
  }
  if(options) {
    collision.options();
    screen.options();
  }
  
} // End draw


