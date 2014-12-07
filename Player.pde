// This class has everything to do with the player.

class Player {
  
  
  void displayStats() {
    // Positions will need to be altered when font is changed
   text("Lives : " + playerLives, 20, 0);
   text("Points: " + playerScore, 30, 0); 
  }
}
