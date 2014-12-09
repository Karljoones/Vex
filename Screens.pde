// This class is used to control the splash screens of the game

class Screens {
 
 // Main menu screen
 void mainMenu() {
    clear();
    background(0);
    
    image(startScreen, 0, 0, width, height);
    // Main menu buttons
    stroke(255);
    fill(206,245,247);
    textAlign(CENTER);
    textFont(mainMenuFont, 43);
    rectMode(CENTER);
    rect((width/2), (height/2), 300, 420, 25, 0, 25, 0);
    fill(0);
    noStroke();
    rect((width/2), (height/2) - 150, buttonWidth, buttonHeight, 25, 0, 25, 0);
    fill(21,231,246);
    text("Start game", (width/2), (height/2) - 130);
    fill(0);
    rect((width/2), (height/2) - 50, buttonWidth, buttonHeight, 25, 0, 25, 0);
    fill(21,231,246);
    text("How to", (width/2), (height/2) - 30);
    fill(0);
    rect((width/2), (height/2) + 50, buttonWidth, buttonHeight, 25, 0, 25, 0);
    fill(21,231,246);
    text("Options", (width/2), (height/2) + 70);
    fill(0);
    rect((width/2), (height/2) + 150, buttonWidth, buttonHeight, 25, 0, 25, 0);
    fill(21,231,246);
    text("Exit", (width/2), (height/2) + 170);
    
    if(debugging) {
     text(frameRate, (width - 80), 30);
   }
 } 
 
 // Game play screen
 void game() {
   clear();
   
   generation.startPlatform();
   
   if(debugging) {
     text(frameRate, (width - 80), 30);
   }
   
   player.displayStats();
 }
 
 // Instructions
 void instructionsScreen() {
   
 }
}
