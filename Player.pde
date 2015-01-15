class Player {
  
  // Avatars, to be implemented at a later stage in the game development.
  boolean avatar1 = true;
  boolean isOnGround;
  
  // Jump power and run speed can be added to by the upgrades, these are just the bases for the start of the game with no upgrades.
  final float jump_power = verticalMax + playerSize, run_speed = 5.0, air_run = 2.0, friction = 0.6, air_resist = 0.85;
  
  // Player class constructor
  Player() {
    velocity = new PVector();
  }
  
  // This is called to call all of the functions, just used to clean up the main pde..
  void play() {
    input();
    move();
    draw();
  }
  
  // Display the stats of the player, coins and their score.
  void displayStats() {
   textFont(playerStatsDisplay, 30);
   textAlign(CENTER);
   stroke(255);
   text("Coins : " + playerCoins, 70, 30);
   text("Points: " + playerScore, 70, 65); 
  } // End displayStats()

  void input() {   
    float curSpeed = (pCollision.isOnGround() ? run_speed : air_run);
    float curFriction = (pCollision.isOnGround() ? friction : air_resist);
    
    if(holdingRight) {
      velocity.x += curSpeed;
    }
    
    velocity.x *= curFriction;
     
    if(!pCollision.isOnGround()) {
      velocity.y += gravity;
    }
  } // End input()
  
  void jump() {
    if(pCollision.isOnGround()) {
      velocity.y += -jump_power;
    }
  }
  
  void move() {
    if(pCollision.playerWalls() == false) {
      line1_start.sub(velocity);
      line1_end.sub(velocity);
      line2_start.sub(velocity);
      line2_end.sub(velocity);
      line3_start.sub(velocity);
      line3_end.sub(velocity);
      line4_start.sub(velocity);
      line4_end.sub(velocity);
      line5_start.sub(velocity);
      line5_end.sub(velocity);
      line6_start.sub(velocity);
      line6_end.sub(velocity);
      line7_start.sub(velocity);
      line7_end.sub(velocity);
      line8_start.sub(velocity);
      line8_end.sub(velocity);
    }
  }
  
  // Drawing the player, more avatars are to be added in the future, this gives the code room for expansion by simply adding the code, 
  void draw() {
    if(avatar1) {
      stroke(0,255,0);
      noFill();
      rect(playerPos.x, playerPos.y, playerSize, playerSize);
    }
    
  } // End draw()
} // End class
