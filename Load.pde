// This class is used to load in all the files that the program needs to load into the game, it 
// done once at the start of the game into global arrays to be used by the other files in the
// program.

class Load {
  
  // Load the fonts into the game
  void loadFonts() {
    mainMenuFont = loadFont("FlynnHollow-48.vlw");
    playerStatsDisplay = loadFont("ARDESTINE-48.vlw");
  }
  
  // Load the images into the game
  void loadImages() {
    startScreen = loadImage("startscreen.jpg"); 
  }
  
  // Initialise player stats
  void initialiseGame() {
    // Set player stats
    playerLives = 3;
    playerScore = 0;
  }
  
  // Initialise the vectors
  void loadVectors() {
    
    // This sets the starting platform
    line1_start = new PVector(0, height - 100);
    line1_end = new PVector(width, height - 100);
    
    line2_start = new PVector(0,0);
    line2_end = new PVector(0,0);
    
    line3_start = new PVector(0,0);
    line3_end = new PVector(0,0);
    
    line4_start = new PVector(0,0);
    line4_end = new PVector(0,0);  
     
    line5_start = new PVector(0,0);
    line5_end = new PVector(0,0);
    
    line6_start = new PVector(0,0);
    line6_end = new PVector(0,0);
  }
  
} // End class
