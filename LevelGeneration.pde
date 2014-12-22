/* 
This fill is used to randomly generate the levels as the player 
scrolls through them. It needs to be able to detect when a line 
goes off the screen to replace it with another one starting at
the end of the previous line and going either vertically or
horizontally.
Lines on the screen at any one time: 6
*/

class levelGen {

  // This is used to generate the start point of the level.
  void startPlatform() {
    stroke(255);
    line(line1_start.x, line1_start.y, line1_end.x, line1_end.y);
  }
  
  // This is going to be used to check if a line has gone
  // off the screen and if it is then it sends the signal
  // to create a new platform in the right orientation
  void check(){
    if(lineOrientation) {
      createVer();
      println("level generation : vertical : OK"); 
      lineOrientation = !lineOrientation;
    } else {
      createHor();
      println("level generation : horizontal : OK");
      lineOrientation = !lineOrientation;
    }
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
