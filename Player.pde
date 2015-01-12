class Player {
  
  // Avatars, to be implemented at a later stage in the game development.
  boolean avatar1 = true;
  int playerSpeed = 20, playerVSpeed = 10;
  
  // Display the stats of the player, coins and their score.
  void displayStats() {
   textFont(playerStatsDisplay, 30);
   textAlign(CENTER);
   stroke(255);
   text("Coins : " + playerCoins, 70, 30);
   text("Points: " + playerScore, 70, 65); 
  } // End displayStats()
  
  // Player movement, player can only move to the right.
  void move() {
    while(movingRight) {
      line1_start.x -= playerSpeed;
      line1_end.x -= playerSpeed;
      line2_start.x -= playerSpeed;
      line2_end.x -= playerSpeed;
      line3_start.x -= playerSpeed;
      line3_end.x -= playerSpeed;
      line4_start.x -= playerSpeed;
      line4_end.x -= playerSpeed;
      line5_start.x -= playerSpeed;
      line5_end.x -= playerSpeed;
      line6_start.x -= playerSpeed;
      line6_end.x -= playerSpeed;
    }
  } // End player movement
  
  // Drawing the player, more avatars are to be added in the future, this gives the code room for expansion by simply adding the code, 
  void draw() {
    if(avatar1) {
      
      stroke(255);
      noFill();
      rect(playerPos.x, playerPos.y, playerSize, playerSize);
    }
  } // End draw()
} // End class
