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
    fill(0);
    noStroke();
    text("Vex", (width/2), (height/2) - 50);
    rectMode(CENTER);
    rect((width/2), (height/2), 300, 420, 25, 25, 25, 25);
    
    // Start button
    fill(0);
    if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonHeight/2)) {
         fill(128,128,128);
       }
    }
    noStroke();
    rect((width/2), (height/2) - 150, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21,231,246);
    text("Start game", (width/2), (height/2) - 130);
    
    // Instructions button
    fill(0);
    if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonHeight/2)) {
         fill(128,128,128);
       }
    }
    rect((width/2), (height/2) - 50, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21,231,246);
    text("How to", (width/2), (height/2) - 30);

    // Options button
    fill(0);
    if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
         fill(128,128,128);
       }
    }
    rect((width/2), (height/2) + 50, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21,231,246);
    text("Options", (width/2), (height/2) + 70);
    
    // Exit button
    fill(0);
    if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 150) - (buttonHeight/2)) && mouseY < ((height/2) + 150) + (buttonHeight/2)) {
         fill(128,128,128);
       }
    }
    rect((width/2), (height/2) + 150, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21,231,246);
    text("Exit", (width/2), (height/2) + 170);
    
    if(debugging) {
     text(frameRate, (width - 80), 30);
   }
 } 
 
 // Game play screen
 void game() {
   clear();
   background(0);
   
   if(i == 0) {
     generation.startPlatform();
     i++;
   }
   
   if(debugging) {
     text(frameRate, (width - 80), 30);
   }
   
   player.displayStats();
   
 }
 
 // Instructions
 void instructionsScreen() {
   
 }
}
