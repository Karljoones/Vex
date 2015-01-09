//Random generation of the level. It will detect the orientation
//of the previous segment of the game, and do the opposite of what
//the previous one was.

class levelGen {

  // This is used to generate the start point of the level.
  void startPlatform() {
    stroke(255);
    line(line1_start.x, line1_start.y, line1_end.x, line1_end.y);
    line(line2_start.x, line2_start.y, line2_end.x, line2_end.y);
  }
  
  // This is going to be used to check if a line has gone
  // off the screen and if it is then it sends the signal
  // to create a new platform in the right orientation
  void check(){
//    if(line1_end.x < 0 ) {
//      line4_start.x = line3_end.x;
//      line4_start.y = line4.end.y;
//    }
  } 
  
  // This creates a wall
  void createVer() {
    stroke(255,5,5);
    line(line1_start.x, line1_start.y, line1_end.x, line1_end.y);
  }
  
  // This creates a platform.
  void createHor() {
    
  }
  
} // End class
