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
          load.initialiseGame();
          
          noCursor();
          
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
 
 void play() {
   if(powerUpScreen || characterSelection) {
     if(mousePressed) {
       if(powerUpScreen){
         // Right button - speed upgrade button
         if(mouseX > halfWidth - windowWidthS - 40 - (windowWidthS / 2) && mouseX < halfWidth - windowWidthS - 40 + (windowWidthS / 2)) {
           if(mouseY > (halfHeight - (windowHeightS / 2)) && mouseY < (halfHeight + (windowHeightS / 2))) {
             if(!speed1B && !speed2B && !speed3B) {
              if(playerScore >= speed1Cost) {
                speed1B = true;
                playerScore -= speed1Cost;
              } 
             }
            if(speed1B) {
              if(playerScore >= speed2Cost) {
                speed1B = false;
                speed2B = true;
              }
            }
            if(speed2B) {
              if(playerScore >= speed3Cost) {
                speed1B = false;
                speed2B = false;
                speed3B = true;
              }
            }
           }
         }
         
         // Middle button - jump upgrade button
         if(mouseX > (halfWidth - (windowWidthS / 2)) && mouseX < (halfWidth + (windowWidthS / 2))) {
           if(mouseY > (halfHeight - (windowHeightS / 2)) && mouseY < (halfHeight + (windowHeightS / 2))) {
             
             if(!jump1B && !jump2B) {
               if(playerScore >= jump1Cost) {
                 jump1B = true;
                 playerScore -= jump1Cost;
               }
             }
             if(jump1B) {
               if(playerScore >= jump2Cost) {
                 jump2B = true;
                 jump1B = false;
                 playerScore -= jump2Cost;
               }
             }
           }
         } // End of middle button
         
         // Left button - weapons / health upgrade button
         if(mouseX > halfWidth + windowWidthS + 40 && mouseX < halfWidth + windowWidthS + 40 + (windowWidthS / 2)) {
           if(mouseY > (halfHeight - (windowHeightS / 2)) && mouseY < (halfHeight + (windowHeightS / 2))) {
             
           }
         }
       } // End powerupscreen
       
       if(characterSelection) {
         // Right button - Billy, avatar1
         if(mouseX > halfWidth - windowWidthS - 40 - (windowWidthS / 2) && mouseX < halfWidth - windowWidthS - 40 + (windowWidthS / 2)) {
           if(mouseY > (halfHeight - (windowHeightS / 2)) && mouseY < (halfHeight + (windowHeightS / 2))) {
              avatar1 = true;
              avatar2 = false;
              avatar3 = false;
           }
         }
         
         // Middle button - Sammie, avatar2
         if(mouseX > (halfWidth - (windowWidthS / 2)) && mouseX < (halfWidth + (windowWidthS / 2))) {
           if(mouseY > (halfHeight - (windowHeightS / 2)) && mouseY < (halfHeight + (windowHeightS / 2))) {
             if(avatar2Unlocked){
               avatar1 = false;
               avatar2 = true;
               avatar3 = false;
             } 
             if(!avatar2Unlocked) {
               if(playerScore >= avatar2Cost) {
                 playerScore -= avatar2Cost;
                 avatar2Unlocked = true;
                 avatar1 = false;
                 avatar2 = true;
                 avatar3 = false;
               }
             }
           }
         } // End of middle button
         
         // Left button - Terry, avatar3
         if(mouseX > halfWidth + windowWidthS + 40 && mouseX < halfWidth + windowWidthS + 40 + (windowWidthS / 2)) {
           if(mouseY > (halfHeight - (windowHeightS / 2)) && mouseY < (halfHeight + (windowHeightS / 2))) {
             if(avatar3Unlocked){
               avatar1 = false;
               avatar2 = false;
               avatar3 = true;
             }
             if(!avatar3Unlocked) {
               if(playerScore >= avatar3Cost) {
                 playerScore -= avatar3Cost;
                 avatar3Unlocked = true;
                 avatar1 = false;
                 avatar2 = false;
                 avatar3 = true;
               }
             }
           }
         }
         
       } // End if(characterSelection)
     } // End if(mousePressed)
     
   } // End if(powerUpScreen)
   
 } // End play()
 
} // End class
  
