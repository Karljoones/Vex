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
Menu collision;
Particle ps;

// Booleans
boolean mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false;

// User defined options
boolean musicOPT = false, SFXOPT = true, debugging = true;

// Level walls and platforms
PVector line1_start, line1_end, line2_start, line2_end, line3_start, line3_end, line4_start, line4_end, line5_start, line5_end, line6_start, line6_end;
boolean lineOrientation = true;

//// Player variables
PVector playerPos;
int playerScore, playerCoins;

// Fonts
PFont mainMenuFont, playerStatsDisplay, instructions;

// Misc
int buttonWidth = 310, buttonHeight = 90; // These values are used for all of the menus in the game.
int i = 0, delay = 300;

// Sounds
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
 collision = new Menu();
 ps = new Particle();
 
 minim = new Minim(this);
 
 load.loadFonts();
 load.loadImages();
 load.loadVectors();
 load.loadMusic();
 load.loadSounds();
 
 playerPos = new PVector(width / 2, height / 2);
 
 if(musicOPT){
   mainMenuMusic.loop();
 }
 
 // Sine wave control
 w = width + 16;
 dx = (TWO_PI / period) * spacing;
 yvalues = new float[int(w/spacing)];
 
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



