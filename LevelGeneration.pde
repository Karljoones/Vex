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
    stroke(21,231,246);
    line(0, height-100, width, height-100);
  }
  
  // This is going to be used to check if a line has gone
  // off the screen and if it is then it sends the signal
  // to create a new line.
  void check(){
    
  } 
  
  // This creates a wall
  void createVer() {
    
  }
  
  // This creates a platform.
  void createHor() {
    
  }
}
