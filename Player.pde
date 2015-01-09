// Player

class Player {
  
  // Avatars, to be implemented at a later stage in the game development.
  boolean avatar1 = true, avatar2 = false;
  
  int playerSize = 50, playerSpeed = 20, playerVSpeed =  10;
  
  void displayStats() {
   // Positions will need to be altered when font is changed
   textFont(playerStatsDisplay, 30);
   textAlign(CENTER);
   stroke(255);
   text("Coins : " + playerCoins, 70, 30);
   text("Points: " + playerScore, 70, 65); 
  }
  
// Player movement
  void move() {
    if(keyPressed) {
      if(keyCode == LEFT) {
        // Move all of the platforms with it, y never needs to be changed.
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
      if(keyCode == RIGHT) {
        // Move all of the platforms with it, y never needs to be changed.
        line1_start.x += playerSpeed;
        line1_end.x += playerSpeed;
        line2_start.x += playerSpeed;
        line2_end.x += playerSpeed;
        line3_start.x += playerSpeed;
        line3_end.x += playerSpeed;
        line4_start.x += playerSpeed;
        line4_end.x += playerSpeed;
        line5_start.x += playerSpeed;
        line5_end.x += playerSpeed;
        line6_start.x += playerSpeed;
        line6_end.x += playerSpeed;
      }
      if(keyCode == UP) {
        // Y should change when the player jumps
      }
      // Exit to the menu.
      if(key == 'm' || key == 'M') {
        play = false;
        mainMenu = true;
        themeSong.close();
        mainMenuMusic = minim.loadFile("mainMenuMusic.mp3", 2048);
        mainMenuMusic.loop();
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
  } // End update
  
}
