class Menu {
  
 // Main menu
 void mainMenu() {
   if(mousePressed) {
     // If start is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonHeight/2)) {
          delay(200);
          mainMenu = false;
          play = true;
          load.loadVectors();
          
          if(SFXOPT) {
            selectKey.play();
          }
          
          mainMenuMusic.close();
          
          themeSong = minim.loadFile("themeSong.mp3", 2048);
          if(musicOPT) {
            if(!themeSong.isLooping()){
              themeSong.loop();
            }
          }
       }
     } // End start game
     
     // If instructions is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonHeight/2)) {
          delay(200);
          mainMenu = false;
          instructionsScreen = true;
          if(SFXOPT) {
            selectKey.play();
          }
       }
     } // End instructions
     
     // If options is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {    
          delay(200);
          mainMenu = false;
          options = true;
         
          if(SFXOPT) {
            selectKey.play();
          }
       }
     } // End options
     
     // If exit is clicked
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 150) - (buttonHeight/2)) && mouseY < ((height/2) + 150) + (buttonHeight/2)) {
         delay(200);
         exit();
         stop();
         if(SFXOPT) {
            selectKey.play();
          }
         // Game is ended
       }
     } // End exit
   } // End mousepressed
 } // End mainmenu
 
  // Options menu
  void options() {
   if(mousePressed) {
     
     // Debugging aka framerate display. To be implemented: playerSpeed, difficulty(to do with player speed).
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonHeight/2)) {
         delay(200);
          debugging = !debugging;
          if(SFXOPT) {
            selectKey.play();
          }
       }
     } 
     
     // Music
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonHeight/2)) {
         delay(200);
          musicOPT = !musicOPT;
          if(SFXOPT) {
            selectKey.play();
          }
          
          if(!musicOPT){
            mainMenuMusic.close();
          } else {
            mainMenuMusic = minim.loadFile("mainMenuMusic.mp3", 2048);
            mainMenuMusic.play();
          }
       }
     } 
     
     // Sound effects
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
          delay(200);
          SFXOPT = !SFXOPT;
          
          if(SFXOPT) {
            selectKey.play();
          }
       }
     } 
     
     // Back to main menu
     if(mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
       if(mouseY > (((height/2) + 150) - (buttonHeight/2)) && mouseY < ((height/2) + 150) + (buttonHeight/2)) {
         delay(200);
         options = false;
         mainMenu = true;
         
         if(SFXOPT) {
            selectKey.play();
          }
       }
     } // End exit
   } // End mousePressed
 } // End options menu
 
} // End class
  
