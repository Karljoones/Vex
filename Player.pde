// This class has everything to do with the player.

class Player {
  
  // Avatars
  boolean avatar1 = true, avatar2 = false;
  
  int playerSize = 50, playerSpeed = 20, playerVSpeed =  10;
  
  void displayStats() {
   // Positions will need to be altered when font is changed
   textFont(playerStatsDisplay, 30);
   textAlign(CENTER);
   stroke(255);
   text("Lives : " + playerLives, 70, 30);
   text("Points: " + playerScore, 70, 65); 
  }
  
  // Player movement
  void move() {
    if(keyPressed) {
      if(keyCode == LEFT) {
        playerPos.x -= playerSpeed;
        if(playerPos.x < 0) {
          playerPos.x = width;
        }
      }
      if(keyCode == RIGHT) {
        playerPos.x += playerSpeed;
        if(playerPos.x > width) {
          playerPos.x = 0;
        }
      }
      if(keyCode == UP) {
        playerPos.y -= playerVSpeed;
      }
      if(key == 'p' || key == 'P') {
        play = false;
        mainMenu = true;
      }
    }
  } // End player movement
  
  // Drawing the player
  void update() {
    
    // Drawing the player, depending on the avatar that they have chosen
    if(avatar1) {
      
      stroke(255);
      noFill();
      rectMode(CENTER);
      rect(playerPos.x, playerPos.y, playerSize, playerSize);
    }
  }
}
