// Class to control the collision of the objects

class Collision {

 // This is the collision code that the main menu uses for its menu.
 void mainMenu() {
   if(mousePressed) {
     
     // If start is clicked
     if(mouseX > ((width / 2) - (buttonWidth / 2)) && mouseY > ((height / 2) - 150)) {
       if(mouseX < (((width / 2) - (buttonWidth / 2)) + buttonWidth) && mouseY > (((height / 2) - 150))) {
         if(mouseX > ((width / 2) - (buttonWidth / 2)) && mouseY < (((height / 2) - 150) + buttonHeight)) {
           if(mouseX < (((width / 2) - (buttonWidth / 2)) + buttonWidth) && mouseY < (((height / 2) - 150) + buttonHeight)) {
             mainMenu = false;
             play = true;
           }
         }
       }
     } // End start game
     
     // if instructions is clicked
     if(mouseX > ((width / 2) - (buttonWidth / 2)) && mouseY > ((height / 2) - 50)) {
       if(mouseX < (((width / 2) - (buttonWidth / 2)) + buttonWidth) && mouseY > (((height / 2) - 50))) {
         if(mouseX > ((width / 2) - (buttonWidth / 2)) && mouseY < (((height / 2) - 50) + buttonHeight)) {
           if(mouseX < (((width / 2) - (buttonWidth / 2)) + buttonWidth) && mouseY < (((height / 2) - 50) + buttonHeight)) {
             mainMenu = false;
             instructionsScreen = true;
           }
         }
       }
     }
     
     // if options is clicked
     if(mouseX > ((width / 2) - (buttonWidth / 2)) && mouseY > ((height / 2) - 50)) {
       if(mouseX < (((width / 2) - (buttonWidth / 2)) + buttonWidth) && mouseY > (((height / 2) - 50))) {
         if(mouseX > ((width / 2) - (buttonWidth / 2)) && mouseY < (((height / 2) - 50) + buttonHeight)) {
           if(mouseX < (((width / 2) - (buttonWidth / 2)) + buttonWidth) && mouseY < (((height / 2) - 50) + buttonHeight)) {
             mainMenu = false;
             options = true;
           }
         }
       }
     }
     
     // if exit is clicked
     if(mouseX > ((width / 2) - (buttonWidth / 2)) && mouseY > ((height / 2) - 50)) {
       if(mouseX < (((width / 2) - (buttonWidth / 2)) + buttonWidth) && mouseY > (((height / 2) - 50))) {
         if(mouseX > ((width / 2) - (buttonWidth / 2)) && mouseY < (((height / 2) - 50) + buttonHeight)) {
           if(mouseX < (((width / 2) - (buttonWidth / 2)) + buttonWidth) && mouseY < (((height / 2) - 50) + buttonHeight)) {
             mainMenu = false;
             instructionsScreen = true;
           }
         }
       }
     }
   }
 } // end mousepressed()
} // End class
  
