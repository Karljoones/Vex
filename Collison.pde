// Player collision and enemy collision code goes here . . . 

class Collision {
  
  // Check if the player is sitting on the ground.
  void playerPlatforms() {
    
  }
  
  // Sketches out the boundaries of the player, only needs to be called once.
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
