// This class is used to control the splash screens of the game

class Screens {
 
 // Main menu screen
 void mainMenu() {
    clear();
    background(0);
    
    // Main menu buttons
    stroke(255);
    fill(206,245,247);
    textAlign(CENTER);
    textFont(mainMenuFont, 43);
    rectMode(CENTER);
    rect((width/2), (height/2), 300, 420, 25, 0, 25, 0);
    fill(0);
    noStroke();
    rect((width/2), (height/2) - 150, 290, 90, 25, 0, 25, 0);
    fill(21,231,246);
    text("Start game", (width/2), (height/2) - 130);
    fill(0);
    rect((width/2), (height/2) - 50, 290, 90, 25, 0, 25, 0);
    fill(21,231,246);
    text("How to", (width/2), (height/2) - 30);
    fill(0);
    rect((width/2), (height/2) + 50, 290, 90, 25, 0, 25, 0);
    fill(21,231,246);
    text("Options", (width/2), (height/2) + 70);
    fill(0);
    rect((width/2), (height/2) + 150, 290, 90, 25, 0, 25, 0);
    fill(21,231,246);
    text("Exit", (width/2), (height/2) + 170);
 } 
 
 // Game play screen
 void game() {
   clear();
   
   // Game border
   float borderWidth = width - 200;
   float borderHeight = height - 200;

   // Draw the grid
   rect(100, 100, borderWidth, borderHeight);
   noFill();
   stroke(21, 231, 246, 70);
   for (float i = 100 ; i < width - 100 ; i += borderWidth / 30) {
     line(i, 100, i, height - 100);
   }
   for (float i = 100; i < height - 100; i += borderHeight / 20) {
     line(100, i, width - 100, i);
   }
   
   if(debugging) {
     text(frameRate, 0, 10);
   }
   
   player.displayStats();
 }
}
