// Load files into the system

class Load {
  
  // Load the fonts into the game
  void loadFonts() {
    mainMenuFont = loadFont("FlynnHollow-48.vlw");
    playerStatsDisplay = loadFont("ARDESTINE-48.vlw");
    instructions = loadFont("AgencyFB-Reg-48.vlw");
  }
  
  // Load the images into the game
  void loadImages() {
    // None at present.
  }
  
  // Initialise player stats
  void initialiseGame() {
    playerCoins = 0;
    playerScore = 0;
  }
  
  // Initialise the vectors
  void loadVectors() {
    
    // Horizontal
    line1_start = new PVector(0, height - 100);
    line1_end = new PVector(width - 50, height - 100);
    
    // Vertical
    line2_start = new PVector(line1_end.x, line1_end.y); // Start point of the line same as the end point of the one before it.
    line2_end = new PVector(line1_end.x, random(20,100)); // Line goes upwards to a random point, x value stays the same.
    
    //Horizontal
    line3_start = new PVector(0,0);
    line3_end = new PVector(0,0);
    
    // Vertical
    line4_start = new PVector(0,0);
    line4_end = new PVector(0,0);  
    
    // Horizontal
    line5_start = new PVector(0,0);
    line5_end = new PVector(0,0);
    
    // Vertical
    line6_start = new PVector(0,0);
    line6_end = new PVector(0,0);
  } // End loadVectors
  
  // Load the music into the game
  void loadMusic() {
    mainMenuMusic = minim.loadFile("mainMenuMusic.mp3", 2048);
    themeSong = minim.loadFile("themeSong.mp3", 2048);    
  }
  
  // Load the sounds into the game
  void loadSounds() {
    selectKey = minim.loadFile("Blip_Select.wav");
  }
  
} // End class
