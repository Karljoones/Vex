// Player collision and enemy collision code goes here . . . 

class Collision {
  
  String line2_Status, line4_Status, line6_Status, line8_Status;
  
  // This function returns false if the player is below the platform, needs to check both bottom corners of the player to make sure its not sitting on an edge.
  boolean playerPlatforms() {
    if(playerBoundaries[5] < line1_start.y || playerBoundaries[7] < line1_start.y) {
      return false;
    } else if(playerBoundaries[5] < line3_start.y || playerBoundaries[7] < line3_start.y) {
      return false;
    } else if(playerBoundaries[5] < line5_start.y || playerBoundaries[7] < line5_start.y) {
      return false;
    } else if(playerBoundaries[5] < line7_start.y || playerBoundaries[7] < line7_start.y) {
      return false;
    } else {
      return true;
    }
  }
  
  // Check if the player is hitting any of the walls, line 2, 4 and 6. needs to check which side of the player the line is on first and then calculate with that.
  boolean playerWalls() {
    boolean hittingWall = true;
    
    if(line2_start.y > line2_end.y) {
      line2_Status = "DOWN";
    } else {
      line2_Status = "UP";
    }
    
    if(line4_start.y > line4_end.y) {
      line4_Status = "DOWN";
    } else {
      line4_Status = "UP";
    }
    
    if(line6_start.y > line6_end.y) {
      line6_Status = "DOWN";
    } else {
      line6_Status = "UP";
    }
    
    // Check if the player is hitting them from the left.
    if(line2_Status == "UP" || line4_Status == "UP" || line6_Status == "UP" || line8_Status == "UP") {
      if(playerBoundaries[2] > line2_start.x){
        hittingWall = false;
      } else if(playerBoundaries[2] > line4_start.x){
        hittingWall = false;
      } else if(playerBoundaries[2] > line6_start.x){
        hittingWall = false;
      } else if(playerBoundaries[2] > line8_start.x){
        hittingWall = false;
      } else {
        hittingWall = true;
      }
    } // End if(line is going up)
    
    // Check if the player is hitting them from the right
    if(line2_Status == "DOWN" || line4_Status == "DOWN" || line6_Status == "DOWN" || line8_Status == "DOWN") {
      if(playerBoundaries[0] < line2_start.x){
        hittingWall = false;
      } else if(playerBoundaries[0] < line4_start.x){
        hittingWall = false;
      } else if(playerBoundaries[0] < line6_start.x){
        hittingWall = false;
      } else if(playerBoundaries[0] < line8_start.x){
        hittingWall = false;
      } else {
        hittingWall = true;
      }
    } // End if(line is heading downwards)
    
    return hittingWall;
  }
  
  // Sketches out the boundaries of the player, only needs to be called once as the player itself does not move.
  void checkPlayerBoundaries() {
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
}
