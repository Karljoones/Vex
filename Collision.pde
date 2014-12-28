//Detects button presses for the menus and player collision with objects

class Collision {

 // Main menu
 void mainMenu() {
   if(mousePressed) {
     // If start is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonHeight/2)) {
          mainMenu = false;
          play = true;
       }
     } // End start game
     
     // If instructions is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonHeight/2)) {
          mainMenu = false;
          instructionsScreen = true;
       }
     } // End instructions
     
     // If options is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
          mainMenu = false;
          options = true;
       }
     } // End options
     
     // If exit is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
         exit();
         stop();
         // Game is ended
       }
     } // End exit
   } // End mousepressed
 } // End mainmenu
 
  // Options menu
  void options() {
   if(mousePressed) {
     
     // Debugging
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonHeight/2)) {
          debugging = !debugging;
       }
     } 
     
     // Music
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonHeight/2)) {
          musicOPT = !musicOPT;
       }
     } 
     
     // Sound effects
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
          SFXOPT = !SFXOPT;
       }
     } 
     
     // Back to main menu
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
         options = false;
         mainMenu = true;
       }
     } // End exit
   } // End mousePressed
 } // End options
 
} // End class
  
