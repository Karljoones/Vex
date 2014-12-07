// TRON inspired game

// Class files
Screens screen;
Player player;
Load load;

// Booleans
boolean debugging = true, mainMenu = false, instructionsScreen = false, play = true, gameOver = false;

// Player variables
float playerX, playerY;
int playerScore, playerLives;

// Fonts
PFont mainMenuFont;

void setup() {
 size(displayWidth, displayHeight);
 frame.setResizable(true); 
 
 screen = new Screens();
 load = new Load();
 player = new Player();
 
 // These two functions load all the files amnd initialise the game for the player to be able to play.
 load.loadFonts();
 load.initialiseGame();
}

void draw() {
  background(0); 
  println(frameRate);
  
  if(mainMenu) {
    screen.mainMenu();
  }
  if(instructionsScreen) {
    //screen.instructionScreen();
  }
  if(play) {
    screen.game();
  }
  if(gameOver) {
    //screen.gameOver();
  }
}
/*
void mouseClicked() {
  if(mainMenu) {  
<<<<<<< HEAD
    // Start game menu option. NOT DONE YET, NEEDS TO BE ADJUSTED TO FIT THE SCREEN PROPERLY
=======
    // Start game menu option. NOT DONE YET, NEEDS TO BE ADJUSTED TO MATCH THE BUTTONS ON THE START MENU
>>>>>>> 7f8e5e6e05cc7dfb2465039b9322952fb84dd0a6
    if(mouseX > ((width / 2) - 100) && mouseY > ((height / 2) - 90)) {
      if(mouseX < (((width / 2) - 100) + buttonWidth) && mouseY > (((height / 2) - 90))) {
        if(mouseX > ((width / 2) - 100) && mouseY < (((height / 2) - 90)) + buttonHeight) {
          if(mouseX < (((width / 2) - 100) + buttonWidth) && mouseY < (((height / 2) - 90) + buttonHeight)) { 
            mainMenu = false;
            play = true;
          }
        }
      }
    }
  }
} */
