class Player {
  boolean avatar1 = true;
  boolean isOnGround;
  
  // These are the base numbers, can be upgraded by user points
  final float jump_power = verticalMax + playerSize, run_speed = 5.0, air_run = 2.0, friction = 0.6, air_resist = 0.85;
  int x, y;
  
  Player(int x, int y) {
    this.x = x;
    this.y = y;
    velocity = new PVector();
  }
  
  Player() {
    this(0, 0);
  }
  
  void play() {
    input();
    move();
    draw();
    score();
  }
  
  // This method keeps track of the players score and adds to it when it is necessary to do so
  void score() {
    if(holdingRight) {
      playerScore++;
    }
  }
  
  void displayStats() {
   textFont(playerStatsDisplay, 30);
   textAlign(CENTER);
   stroke(255);
   text("Coins : " + playerCoins, 70, 30);
   text("Points: " + playerScore, 70, 65); 
  } // End displayStats()

  void input() {   
    curSpeed = (pCollision.isOnGround() ? run_speed : air_run);
    float curFriction = (pCollision.isOnGround() ? friction : air_resist);
    float curJump =  jump_power;
    
    if(speed1B) {
      curSpeed *= speed1;
      println("Current speed is: " + curSpeed + " with a multiplier of: " + speed1);
    } else if (speed2B) {
      curSpeed *= speed2;
      println("Current speed is: " + curSpeed + " with a multiplier of: " + speed2);
    } else if (speed3B) {
      curSpeed *= speed3;
      println("Current speed is: " + curSpeed + " with a multiplier of: " + speed3);
    }
    
    if(jump1B) {
      curJump = jump_power * jump1;
      println("Current jump height is: " + curJump + " with a multiplier of: " + jump1);
    } else if(jump2B) {
      curJump = jump_power * jump2;
      println("Current jump height is: " + curJump + " with a multiplier of: " + jump2);
    }
    
    if(holdingRight) {
      velocity.x += curSpeed;
    }
    if(!debugging){
      if(holdingUp) {
        velocity.y += -curJump;
      }
    }
    
    velocity.x *= curFriction;

    if(!debugging) {
      if(!pCollision.isOnGround()) {
        velocity.y += gravity;
      }
    }
  } // End input()

  void move() {
    if(!debugging) {
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
    if(debugging) {
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
