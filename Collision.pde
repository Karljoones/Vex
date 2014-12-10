// Class to control the collision of the objects

class Collision {

 // This is the collision code that the main menu uses for its menu.
 void mainMenu() {
   if(mousePressed) {
     
     // If start is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonWidth/2)) {
          mainMenu = false;
          play = true;
          
          // Initialise the game, setting lives to 3 and the score to zero
          load.initialiseGame();
          
          // i is set to zero so that it can initialise the starting platform of the game
          i = 0;
       }
     } // End start game
     
     // If instructions is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonWidth/2)) {
          mainMenu = false;
          instructionsScreen = true;
       }
     } // End instructions
     
     // If options is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonWidth/2)) {
          mainMenu = false;
          options = true;
       }
     } // End options
     
     // If exit is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonWidth/2)) {
         exit();
         stop();
       }
     } // End exit
   }
 } // end mousepressed()
} // End class
  
