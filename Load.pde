class Load {
  
  // Load the fonts into the game
  void loadFonts() {
    mainMenuFont = loadFont("FlynnHollow-48.vlw");
    playerStatsDisplay = loadFont("ARDESTINE-48.vlw");
    instructions = loadFont("AgencyFB-Reg-48.vlw");
  }
  
  // Load the images into the game
  void loadImages() {
    // Trying to have as little images loaded in as possible.
  }
  
  // Initialise player stats
  void initialiseGame() {
    playerCoins = 0;
    playerScore = 0;
    velocity.x = 0;
    velocity.y = 0;
  }
  
  // Initialise the vectors, what they start out as, needs to sort itself out while playing the game.
  void loadVectors() {
    
    // Horizontal
    line1_start = new PVector(0, height - 100);
    line1_end = new PVector(width - 50, height - 100);
    
    // Vertical
    line2_start = new PVector(line1_end.x, line1_end.y);
    line2_end = new PVector(line2_start.x, line2_start.y + -random(20, verticalMax));
    
    //Horizontal
    line3_start = new PVector(line2_end.x, line2_end.y);
    line3_end = new PVector(line3_start.x + random(lineMin, lineMax), line3_start.y);
    
    // Vertical
    line4_start = new PVector(line3_end.x, line3_end.y);
    line4_end = new PVector(line4_start.x, line4_start.y + random(verticalMin, verticalMax));  
    
    // Horizontal
    line5_start = new PVector(line4_end.x, line4_end.y);
    line5_end = new PVector(line5_start.x + random(lineMin, lineMax), line5_start.y);
    
    // Vertical
    line6_start = new PVector(line5_end.x, line5_end.y);
    line6_end = new PVector(line6_start.x, line6_start.y + random(verticalMin, verticalMax));
    
    // Horizontal
    line7_start = new PVector(line6_end.x, line6_end.y);
    line7_end = new PVector(line7_start.x + random(lineMin, lineMax), line7_start.y);
    
    // Vertical
    line8_start = new PVector(line7_end.x, line7_end.y);
    line8_end = new PVector(line8_start.x, line8_start.y + random(verticalMin, verticalMax));
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
  
  void loadTextFiles() {
    // Code for loading the text files.. 
  }
  
} // End class
