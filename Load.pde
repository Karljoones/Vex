// This class is used to load in all the files that the program needs to load into the game, it 
// done once at the start of the game into global arrays to be used by the other files in the
// program.

class Load {
  
  void loadFonts() {
    mainMenuFont = loadFont("FlynnHollow-48.vlw");
  }
  
  void initialiseGame() {
    playerLives = 3;
    playerScore = 0;
  }
}
