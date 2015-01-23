// This is used to check the collision of the player against the level or against enemies

class Collision {
  
  String line2_Status, line4_Status, line6_Status, line8_Status; 
  
  // Returns true if the player is hitting a wall
  boolean playerWalls() {
    boolean hittingWall = false;
    
    // Checking if a line goes up or down, only need to check the walls that are going up to see if the player is hitting off them
    line2_Status = (line2_start.y > line2_end.y ? "UP" : "DOWN" );
    line4_Status = (line4_start.y > line4_end.y ? "UP" : "DOWN" );
    line6_Status = (line6_start.y > line6_end.y ? "UP" : "DOWN" );
    line8_Status = (line8_start.y > line8_end.y ? "UP" : "DOWN" );
    
    println("Line2: " + line2_Status);
    println("Line4: " + line4_Status);
    println("Line6: " + line6_Status);
    println("Line8: " + line8_Status);
    
    if(line2_Status == "UP" || line4_Status == "UP" || line6_Status == "UP" || line8_Status == "UP") { 
      if(playerBoundaries[2] > line2_start.x + 15){
        hittingWall = true;
      } else if(playerBoundaries[2] > line4_start.x + 15){
        hittingWall = true;
      } else if(playerBoundaries[2] > line6_start.x + 15){
        hittingWall = true;
      } else if(playerBoundaries[2] > line8_start.x + 15){
        hittingWall = true;
      } else {
        hittingWall = false;
      }
    }
    
    if(hittingWall) { velocity.y = 0.0; }
    
    return hittingWall;
  }

  // Return true if the player is on the ground.
  boolean isOnGround(){
    if(playerBoundaries[4] > line1_start.x && playerBoundaries[6] < line1_end.x) {
      if(playerBoundaries[5] < line1_start.y + 1 || playerBoundaries[5] < line1_start.y || playerBoundaries[5] < line1_start.y - 1) {
        if(playerBoundaries[7] < line1_start.y + 1 || playerBoundaries[7] < line1_start.y || playerBoundaries[7] < line1_start.y - 1) {
          playerPos.y = line1_start.y - (playerSize-20);
          velocity.y = 0.0;
          return true;
        }
      }
    } else if(playerBoundaries[4] > line1_start.x && playerBoundaries[6] < line1_end.x) {
      if(playerBoundaries[5] < line1_start.y + 1 || playerBoundaries[5] < line1_start.y || playerBoundaries[5] < line1_start.y - 1) {
        if(playerBoundaries[7] < line1_start.y + 1 || playerBoundaries[7] < line1_start.y || playerBoundaries[7] < line1_start.y - 1) {
          playerPos.y = line1_start.y - (playerSize-20);
          velocity.y = 0.0;
          return true;
        }
      }
    } else if(playerBoundaries[4] > line3_start.x && playerBoundaries[6] < line3_end.x) {
      if(playerBoundaries[5] < line3_start.y + 1 || playerBoundaries[5] < line3_start.y || playerBoundaries[5] < line3_start.y - 1) {
        if(playerBoundaries[7] < line3_start.y + 1 || playerBoundaries[7] < line3_start.y || playerBoundaries[7] < line3_start.y - 1) {
          playerPos.y = line3_start.y - (playerSize-20);
          velocity.y = 0.0;
          return true;
        }
      }
    } else if(playerBoundaries[4] > line3_start.x && playerBoundaries[6] < line3_end.x) {
      if(playerBoundaries[5] < line3_start.y + 1 || playerBoundaries[5] < line3_start.y || playerBoundaries[5] < line3_start.y - 1) {
        if(playerBoundaries[7] < line3_start.y + 1 || playerBoundaries[7] < line3_start.y || playerBoundaries[7] < line3_start.y - 1) {
          playerPos.y = line3_start.y - (playerSize-20);
          velocity.y = 0.0;
          return true;
        }
      }
    } else if(playerBoundaries[4] > line5_start.x && playerBoundaries[6] < line5_end.x) {
      if(playerBoundaries[5] < line5_start.y + 1 || playerBoundaries[5] < line1_start.y || playerBoundaries[5] < line5_start.y - 1) {
        if(playerBoundaries[7] < line5_start.y + 1 || playerBoundaries[7] < line1_start.y || playerBoundaries[7] < line5_start.y - 1) {
          playerPos.y = line5_start.y - (playerSize-20);
          velocity.y = 0.0;
          return true;
        }
      }
    } else if(playerBoundaries[4] > line5_start.x && playerBoundaries[6] < line5_end.x) {
      if(playerBoundaries[5] < line5_start.y + 1 || playerBoundaries[5] < line5_start.y || playerBoundaries[5] < line5_start.y - 1) {
        if(playerBoundaries[7] < line5_start.y + 1 || playerBoundaries[7] < line5_start.y || playerBoundaries[7] < line5_start.y - 1) {
          playerPos.y = line5_start.y - (playerSize-20);
          velocity.y = 0.0;
          return true;
        }
      }
    } else if(playerBoundaries[4] > line7_start.x && playerBoundaries[6] < line7_end.x) {
      if(playerBoundaries[5] < line7_start.y + 1 || playerBoundaries[5] < line7_start.y || playerBoundaries[5] < line7_start.y - 1) {
        if(playerBoundaries[7] < line7_start.y + 1 || playerBoundaries[7] < line7_start.y || playerBoundaries[7] < line7_start.y - 1) {
          playerPos.y = line7_start.y - (playerSize-20);
          velocity.y = 0.0;
          return true;
        }
      }
    } else if(playerBoundaries[4] > line7_start.x && playerBoundaries[6] < line7_end.x) {
      if(playerBoundaries[5] < line7_start.y + 1 || playerBoundaries[5] < line7_start.y || playerBoundaries[5] < line7_start.y - 1) {
        if(playerBoundaries[7] < line7_start.y + 1 || playerBoundaries[7] < line7_start.y || playerBoundaries[7] < line7_start.y - 1) {
          playerPos.y = line7_start.y - (playerSize-20);
          velocity.y = 0.0;
          return true;
        }
      }
    } else {
      // velocity.y += gravity;      Jumping and the gravity aspect of the game are currently broken
      return false;
    }
    
    return false;
  } // End isOnGround()
  
  // This method works out the boundaries of the player and stores them in playerBoundaries[]
  void checkPlayerBoundaries() {
    if(avatar1) {
      // Top left corner
      playerBoundaries[0] = playerPos.x;
      playerBoundaries[1] = playerPos.y;
      
      // Top right corner
      playerBoundaries[2] = playerBoundaries[0] + playerSize;
      playerBoundaries[3] = playerBoundaries[1];
      
      // Bottom left corner
      playerBoundaries[4] = playerBoundaries[0];
      playerBoundaries[5] = playerBoundaries[1] + playerSize;
      
      // Bottom right corner
      playerBoundaries[6] = playerBoundaries[0] + playerSize;
      playerBoundaries[7] = playerBoundaries[1] + playerSize;
    }
    
    if(avatar2) { // Sammie
      // Top left corner
      playerBoundaries[0] = playerPos.x;
      playerBoundaries[1] = playerPos.y;
      
      // Top right corner
      playerBoundaries[2] = playerBoundaries[0] + playerSize + 15;
      playerBoundaries[3] = playerBoundaries[1];
      
      // Bottom left corner
      playerBoundaries[4] = playerBoundaries[0];
      playerBoundaries[5] = playerBoundaries[1] + playerSize + 15;
      
      // Bottom right corner
      playerBoundaries[6] = playerBoundaries[0] + playerSize + 15;
      playerBoundaries[7] = playerBoundaries[1] + playerSize + 15;
    }
    
    if(avatar3) { // Terry
      // Top left corner
      playerBoundaries[0] = playerPos.x;
      playerBoundaries[1] = playerPos.y;
      
      // Top right corner
      playerBoundaries[2] = playerBoundaries[0] + playerSize + 6;
      playerBoundaries[3] = playerBoundaries[1];
      
      // Bottom left corner
      playerBoundaries[4] = playerBoundaries[0];
      playerBoundaries[5] = playerBoundaries[1] + playerSize + 6;
      
      // Bottom right corner
      playerBoundaries[6] = playerBoundaries[0] + playerSize + 6;
      playerBoundaries[7] = playerBoundaries[1] + playerSize + 6;
    }
  } // End checkPlayerBoundaries()
  
  void enemyCollision() {
    // Enemy collision with the player needs to go here
  }
}
