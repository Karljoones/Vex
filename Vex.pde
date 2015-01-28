//                       Vex
//                      -----
//                    Karl Jones
//                    C13315991

import ddf.minim.*;
Minim minim;

Screens screen;
Player player;
Load load;
levelGen generation;
Menu collision;
Collision pCollision;
Enemy enemy;

boolean mainMenu = true, instructionsScreen = false, play = false, gameOver = false, options = false, powerUpScreen = false, characterSelection = false, devMode = true; // Screen booleans
boolean musicOPT = false, SFXOPT = false, debugging = true;     // User defined options, available in the options menu

// Level variables and menu variables
PVector line1_start, line1_end, line2_start, line2_end, line3_start, line3_end, line4_start, line4_end, line5_start, line5_end, line6_start, line6_end, line7_start, line7_end, line8_start, line8_end;
final int lineMin = 400, lineMax = 2000;             // Level generation: minimum and maximum lengths of the horizontal platforms
final int verticalMin = -200, verticalMax = 200;     // Level generation: minimum and maximum heights of the vertical walls
final int buttonWidth = 310, buttonHeight = 90;      // The menu buttons width and height
PVector onScreenInstructions;                        // This controls the scrolling instructions in the game
String[] instructionsList;                           // This is used to read in the instructions for the game from the instructions.txt file

// Player related variables
PVector playerPos, velocity;
int playerScore, playerCoins, playerSize = 50;
boolean holdingRight, holdingUp = false;
float[] playerBoundaries = new float[8];
final float gravity = 0.5;

// Avatar variables
boolean avatar1 = true, avatar2 = false, avatar3 = false; // Only one can be true at any one time
boolean avatar2Unlocked = false, avatar3Unlocked = false;
final int avatar2Cost = 1000, avatar3Cost = 1500; 

// Player upgrades
boolean speed1B = false, speed2B = false, speed3B = false, jump1B = false, jump2B = false;
String billy = "Billy is your average Joe.. I mean.. er.. Billy.", sammie = "Sammie likes to jump really high.. and fall straight back down. + 50% Jump!", terry = "Think of Terry as a hyperactive kid who likes to run. + 50% Speed!";
final float speed1 = 1.2, speed2 = 1.4, speed3 = 1.6, jump1 = 1.2, jump2 = 1.3, sammieJumpBonus = 1.5, terrySpeedBonus = 1.5;     // Upgrade multipliers
final int speed1Cost = 1000, speed2Cost = 1500, speed3Cost = 2500, jump1Cost = 1000, jump2Cost = 1750;

// Fonts
PFont mainMenuFont, playerStatsDisplay, instructions, upgradeWindowFont, onScreenInstructionsFont, optionsMenuFont;

// Misc
int i = 0, j, halfWidth, halfHeight;

// Enemies variables
String[] firstNames, secondNames, enemyNames;
String EnemyName;
PVector enemyPos = new PVector();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

// Music and sound effects of the game.
AudioPlayer mainMenuMusic, selectKey, themeSong;

// Sine wave control
float theta = 0.0, amplitude = 75.0, period = 500.0, dx, spacing = 16;
int w;
float[] yvalues;

// Power up screen variables
int windowWidthL, windowHeightL, windowWidthS, windowHeightS;

void setup() {
  if (devMode) {
    size(displayWidth, displayHeight);
  } else {
    size(1280, 1024);
  }
  frame.setResizable(true); 
  frameRate(60);

  // Initialise classes
  screen = new Screens();
  load = new Load();
  player = new Player();
  generation = new levelGen();
  enemy = new Enemy();
  collision = new Menu();
  pCollision = new Collision();

  minim = new Minim(this);

  load.loadFonts();
  // load.loadImages(); this is disabled as there is no images at present that need to be added into the game, there for future reference
  load.loadMusic();
  load.loadSounds();
  load.loadTextFiles();

  if (musicOPT) {
    mainMenuMusic.loop();
  }

  // Sine wave variables
  w = width + 16;
  dx = (TWO_PI / period) * spacing;
  yvalues = new float[int(w/spacing)];

  playerPos = new PVector(40, 200);

  pCollision.checkPlayerBoundaries();

  windowWidthL = width - 200;
  windowHeightL = height - 200;
  windowWidthS = windowWidthL / 4;
  windowHeightS = windowHeightL - 200;
}

boolean sketchFullScreen() {
  return ! devMode;
}

void draw() {
  background(0);
  println(frameRate);

  halfWidth = width / 2;
  halfHeight = height / 2;

  if (mainMenu) {
    if (musicOPT) {
      if (!mainMenuMusic.isLooping()) {
        mainMenuMusic.loop();
      }
    }

    collision.mainMenu();
    screen.mainMenu();
  } // End if(mainMenu)

  if (instructionsScreen) {
    screen.instructionsScreen();
  } // End if(instructinosScreen)

  if (play) {
    screen.game();
    player.play();
    generation.work();
    collision.play();
    // enemy.spawnEnemy();     Enemies not yet implemented.

    println("isOnGround() = " + pCollision.isOnGround());
    if (musicOPT) {      // If the music option is selected then the game checks if it is already looping, if it is not looping it plays the music.
      if (!themeSong.isLooping()) {
        themeSong.loop();
      }
    }
  } // End if(play)

  if (options) {
    screen.options();
    collision.options();
  } // End if(options)
} // End draw

void keyPressed() {
  if (play) {
    if (keyCode == RIGHT) {
      holdingRight = true;
    }
    if (keyCode == UP) {
      if (pCollision.isOnGround()) {
        holdingUp = true;
      }
    }
    if (key == 'p' || key == 'P') {
      powerUpScreen = !powerUpScreen;
      if (powerUpScreen) {
        cursor(CROSS);
      } else {
        noCursor();
      }
      characterSelection = false;
    }
    if (key == 'c' || key == 'C') {
      characterSelection = !characterSelection;
      if (characterSelection) {
        cursor(CROSS);
      } else {
        noCursor();
      } 
      powerUpScreen = false;
    }
  } // End if(play)
  if (instructionsScreen) {
    if (key == 'm' || key == 'M') {
      mainMenu = true;
      instructionsScreen = false;
    }
  }
} // End keyPressed()

void keyReleased() {
  if (play) {
    if (keyCode == RIGHT) {
      holdingRight = false;
    }
    if (keyCode == UP) {
      holdingUp = false;
    }
    if (key == 'm' || key == 'M') {
      mainMenu = true;
      play = false;
    }
  } // End if(play)
} //End keyReleased()

