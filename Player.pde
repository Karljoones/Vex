class Player {
  
  // Avatars, to be implemented at a later stage in the game development.
  boolean avatar1 = true;
  boolean isOnGround;
  
  // Jump power and run speed can be added to by the upgrades, these are just the bases for the start of the game with no upgrades.
  static final float jump_power = 11.0, run_speed = 5.0, air_run = 2.0, friction = 0.6, air_resist = 0.85;
  
  // Player class constructor
  Player() {
    isOnGround = false;
    playerPos = new PVector(50, 300);
    velocity = new PVector();
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
    pCollision.checkFalling();
    float curSpeed = (isOnGround ? run_speed : air_run);
    float curFriction = (isOnGround ? friction : air_resist);
    
    if(holdingRight) {
      velocity.x += curSpeed;
    }
    
    velocity.x *= curFriction;
    
    if(pCollision.isOnGround()) {
      if(holdingUp) {
        velocity.y = -jump_power;
      }
    } else {
      velocity.y += gravity;
    }
  } // End input()
  
  void move() {
    playerPos.add(velocity);
    
    pCollision.playerWalls();
  }
  
  // Drawing the player, more avatars are to be added in the future, this gives the code room for expansion by simply adding the code, 
  void draw() {
    if(avatar1) {
      
      stroke(255);
      noFill();
      rect(playerPos.x, playerPos.y, playerSize, playerSize);
    }
  } // End draw()
} // End class
