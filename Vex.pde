// TRON inspired game

// Class files init
Screens screen;
Player player;
Load load;
levelGen generation;
Collision collision;

// Booleans
boolean debugging = true, mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false;

// Player variables
PVector playerPos;
int playerScore, playerLives;

// Fonts
PFont mainMenuFont, playerStatsDisplay;

// Images
PImage startScreen;

// Misc
int buttonWidth = 290, buttonHeight = 90;

void setup() {
 size(displayWidth, displayHeight);
 frame.setResizable(true); 
 
 screen = new Screens();
 load = new Load();
 player = new Player();
 generation = new levelGen();
 collision = new Collision();
 
 // These two functions load all the files amnd initialise the game for the player to be able to play.
 load.loadFonts();
 load.loadImages();
 
 // Set the players initial spawn
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
  }
  if(gameOver) {
    stop();
  }
}

