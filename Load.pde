// This class is used to load in all the files that the program needs to load into the game, it 
// done once at the start of the game into global arrays to be used by the other files in the
// program.

class Load {
  
  // Load the fonts into the program
  void loadFonts() {
    mainMenuFont = loadFont("FlynnHollow-48.vlw");
    playerStatsDisplay = loadFont("ARDESTINE-48.vlw");
  }
  
  void loadImages() {
    startScreen = loadImage("startscreen.jpg"); 
  }
  
  void initialiseGame() {
    // Set player stats
    playerLives = 3;
    playerScore = 0;
  }
}
