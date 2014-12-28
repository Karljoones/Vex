// Load files into the system

class Load {
  
  // Load the fonts into the game
  void loadFonts() {
    mainMenuFont = loadFont("FlynnHollow-48.vlw");
    playerStatsDisplay = loadFont("ARDESTINE-48.vlw");
  } // End loadFonts
  
  // Load the images into the game
  void loadImages() {
    startScreen = loadImage("startscreen.jpg"); 
  } // End loadImages
  
  // Initialise player stats
  void initialiseGame() {
    // Set player stats
    playerLives = 3;
    playerScore = 0;
  } // End initialiseGame
  
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
  } // End loadVectors
  
  // Load the music into the game
  void loadMusic() {
    
  } // End loadMusic()
  
  // Load the sounds into the game
  void loadSounds() {
    
  } // End loadSounds
  
} // End class
