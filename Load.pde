class Load {

  void loadFonts() {
    mainMenuFont = loadFont("FlynnHollow-48.vlw");
    playerStatsDisplay = loadFont("ARDESTINE-48.vlw");
    instructions = loadFont("AgencyFB-Reg-48.vlw");
    upgradeWindowFont = loadFont("CopperplateGothic-Bold-48.vlw");
    onScreenInstructionsFont = loadFont("GloucesterMT-ExtraCondensed-48.vlw");
    optionsMenuFont = loadFont("SourceSansPro-Regular-48.vlw");
  }

  void loadImages() {
    // Loading in the images, used for later expansion of the game
  }

  void initialiseGame() {      // This initialises the game, sets everything to the values needed when the game starts
    playerCoins = 0;
    playerScore = 0;
    velocity.x = 0;
    velocity.y = 0;
    jump1B = jump2B = speed1B = speed2B = speed3B = powerUpScreen = characterSelection = avatar2Unlocked = avatar3Unlocked = false;
    j = 0;
  }

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

    onScreenInstructions = new PVector(halfWidth, 300);
  } // End loadVectors

  void loadMusic() {
    mainMenuMusic = minim.loadFile("mainMenuMusic.mp3");
    themeSong = minim.loadFile("themeSong.mp3");
  }

  void loadSounds() {
    selectKey = minim.loadFile("Blip_Select.wav");
  }

  void loadTextFiles() {
    // String[] firstnames = loadStrings("firstnames.csv");           Not yet implemented as there are no
    // String[] secondnames = loadStrings("secondnames.csv");         enemies being generated to put names on
    instructionsList = loadStrings("instructions.txt");

    // The following two variables are used to generate random names for the enemies, this is not yet implemented as the enemies are not implemented.
    // firstNames = split(firstnames[0], ',');
    // secondNames = split(secondnames[0], ',');
  }
} // End class

