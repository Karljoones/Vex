// Control of the splash screens

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
 } // End main menu
 
 // Game play screen
 void game() {
   clear();
   background(0);
   
   if(debugging) {
     text(frameRate, (width - 80), 30);
   }
   
   // Always called last, want to be above EVERYTHING else all of the time that the gameplay is happening. Needs to be called last.
   player.displayStats();
   
 } // End game play screen
 
  // Options screen
  void options() {
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
    
    // Framerate button
    fill(0);
    if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonHeight/2)) {
         fill(128,128,128);
       }
    }
    noStroke();
    rect((width/2), (height/2) - 150, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21,231,246);
    
    if(debugging) {
      text("Framerate: On", (width/2), (height/2) - 130);
    } else {
      text("Framerate: Off", (width/2), (height/2) - 130);
    }  
    
    // Music button
    fill(0);
    if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonHeight/2)) {
         fill(128,128,128);
       }
    }
    rect((width/2), (height/2) - 50, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21,231,246);
    if(musicOPT) {
      text("Music: On", (width/2), (height/2) - 30);
    } else  {
      text("Music: Off", (width/2), (height/2) - 30);
    }
    
    // SFX button
    fill(0);
    if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
         fill(128,128,128);
       }
    }
    rect((width/2), (height/2) + 50, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21,231,246);
    if(SFXOPT) {
      text("Sound Effects: On", (width/2), (height/2) + 70);
    } else {
      text("Sound Effects: Off", (width/2), (height/2) + 70);
    }
    
    // Return to main menu.
    fill(0);
    if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 150) - (buttonHeight/2)) && mouseY < ((height/2) + 150) + (buttonHeight/2)) {
         fill(128,128,128);
       }
    }
    rect((width/2), (height/2) + 150, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21,231,246);
    text("Back", (width/2), (height/2) + 170); 
    
    // End of buttons
    
    if(debugging) {
     text(frameRate, (width - 80), 30);
    }
  } // End options screen
 
 // Instructions Screen
 void instructionsScreen() {
   background(233,45,34);
 } // End instructions screen
 
} // End class

