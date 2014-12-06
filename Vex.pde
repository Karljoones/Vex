// TRON inspired game

// Class files
Screens screen;
Player player;
Load load;

// Booleans
boolean mainMenu = true, instructionsScreen = false, play = false, gameOver = false;

// Player variables
float playerX, playerY;

// Fonts
PFont mainMenuFont;

void setup() {
 size(displayWidth, displayHeight);
 frame.setResizable(true); 
 
 screen = new Screens();
 load = new Load();
 
 load.loadFonts();
}

void draw() {
  background(0);  
  
  if(mainMenu) {
    screen.mainMenu();
  }
  if(instructionsScreen) {
    //screen.instructionScreen();
  }
  if(play) {
    //acreen.play();
  }
  if(gameOver) {
    //screen.gameOver();
  }
}
