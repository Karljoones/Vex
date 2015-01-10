class Player {
  
  // Avatars, to be implemented at a later stage in the game development.
  boolean avatar1 = true, avatar2 = false;
  int playerSpeed = 20, playerVSpeed = 10;
  
  void displayStats() {
   textFont(playerStatsDisplay, 30);
   textAlign(CENTER);
   stroke(255);
   text("Coins : " + playerCoins, 70, 30);
   text("Points: " + playerScore, 70, 65); 
  }
  
  void keyPressed() {
    if(key == CODED) {
      if(keyCode == RIGHT){
        movingRight = true;
      }
      if(keyCode == LEFT){
        movingLeft = true;
      }
      if(keyCode == UP){
        // Code for jumping. . .
      }
    }
    println(movingRight);
    println(movingLeft);
  }
  
  void keyReleased() {
    if(key == CODED) {
      if(keyCode == RIGHT){
        movingRight = false;
      }
      if(keyCode== LEFT){
        movingLeft = false; 
      }
      if(keyCode == UP){
        // Code for jumping . . .
      }
    }
  }
  // Player movement
  void move() {
    if(movingRight) {
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
    if(movingLeft) {
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
      if(musicOPT) {
        mainMenuMusic = minim.loadFile("mainMenuMusic.mp3", 2048);
        mainMenuMusic.loop();
      }
    }
    
} // End player movement
  
  // Drawing the player
  void update() {
    
    // Avatars will be added at a later stage to the game.
    if(avatar1) {
      
      stroke(255);
      noFill();
      rect(playerPos.x, playerPos.y, playerSize, playerSize);
    }
  } // End update
  
}
