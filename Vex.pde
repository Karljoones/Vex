// TRON inspired game

// Class files init
Screens screen;
Player player;
Load load;
levelGen generation;
Collision collision;

// Booleans
boolean debugging = true, mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false;

// Level lines
PVector line1_start, line1_end, line2_start, line2_end, line3_start, line3_end, line4_start, line4_end, line5_start, line5_end, line6_start, line6_end;

// Player variables
PVector playerPos;
int playerScore, playerLives;

// Fonts
PFont mainMenuFont, playerStatsDisplay;

// Images
PImage startScreen;

// Misc
int buttonWidth = 290, buttonHeight = 90, i;

void setup() {
 size(displayWidth, displayHeight);
 frame.setResizable(true); 
 
 screen = new Screens();
 load = new Load();
 player = new Player();
 generation = new levelGen();
 collision = new Collision();
 
 // These two functions load all the files amnd initialise the game for the player to be able to play
 load.loadFonts();
 load.loadImages();
 
 // Set the players initial spawn
 playerPos = new PVector(width / 2, height / 2);
 
 // Starting lines of the platform. Initialise the starting line
 line1_start = new PVector(0, (height - 100));
 line1_end = new PVector(width, (height - 100));
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
  }
  if(gameOver) {
    stop();
  }
}

