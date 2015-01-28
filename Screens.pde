class Screens {
  // Main menu screen
  void mainMenu() {
    clear();
    background(0);

    pushStyle();
    fill(255, 0, 0);
    textMode(CENTER);
    textFont(mainMenuFont, 70);
    text("VEX", halfWidth, 100); // Main menu VEX sign
    popStyle();

    cursor(CROSS);

    calcWave();
    renderWave();

    stroke(255);
    fill(206, 245, 247);
    textAlign(CENTER);
    textFont(mainMenuFont, 43);
    fill(0);
    noStroke();
    rectMode(CENTER);

    // Start button
    fill(0);
    if (mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
      if (mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonHeight/2)) {
        fill(128, 128, 128);
      }
    }
    noStroke();
    rect((width/2), (height/2) - 150, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21, 231, 246);
    text("Start game", (width/2), (height/2) - 130);

    // Instructions button
    fill(0);
    if (mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
      if (mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonHeight/2)) {
        fill(128, 128, 128);
      }
    }
    rect((width/2), (height/2) - 50, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21, 231, 246);
    text("How to", (width/2), (height/2) - 30);

    // Options button
    fill(0);
    if (mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
      if (mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
        fill(128, 128, 128);
      }
    }
    rect((width/2), (height/2) + 50, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21, 231, 246);
    text("Options", (width/2), (height/2) + 70);

    // Exit button
    fill(0);
    if (mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
      if (mouseY > (((height/2) + 150) - (buttonHeight/2)) && mouseY < ((height/2) + 150) + (buttonHeight/2)) {
        fill(128, 128, 128);
      }
    }
    rect((width/2), (height/2) + 150, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21, 231, 246);
    text("Exit", (width/2), (height/2) + 170);

    if (debugging) {
      fill(255);
      text(frameRate, (width - 80), 30);
    }
  } // End main menu

  // Game play screen
  void game() {
    clear();
    background(0);

    calcWave();
    renderWave();

    // Scrolling instructions on the screen these go to the left as the player goes to the right
    pushStyle();
    textFont(onScreenInstructionsFont, 48);
    textAlign(CENTER);
    fill(255, 100);
    if (j == 0) {
      text("Press the RIGHT key to move and the UP key to jump", onScreenInstructions.x, onScreenInstructions.y); 
      onScreenInstructions.sub(velocity);
      if (onScreenInstructions.x < 0 - halfWidth) { 
        j++; 
        onScreenInstructions.x = width;
      }
      println(j);
    } else if (j == 1) {
      text("Press the c key to select your player", onScreenInstructions.x, onScreenInstructions.y);
      onScreenInstructions.sub(velocity);
      if (onScreenInstructions.x < 0- halfWidth) { 
        j++; 
        onScreenInstructions.x = width;
      }
    } else if (j == 2) {
      text("Press the p key to buy character upgrades", onScreenInstructions.x, onScreenInstructions.y);
      onScreenInstructions.sub(velocity);
      if (onScreenInstructions.x < -width) { 
        j++; 
        onScreenInstructions.x = width;
      }
    } else if (j == 3) {
      text("Press the m key to exit to the main menu, this will erase all your progress", onScreenInstructions.x, onScreenInstructions.y);
      onScreenInstructions.sub(velocity);
      if (onScreenInstructions.x < 0 - halfWidth) { 
        j++; 
        onScreenInstructions.x = width;
      }
    } else if (j == 4) {
      text(" ", onScreenInstructions.x, onScreenInstructions.y); // This is the template to add more text that scrolls through the level
      onScreenInstructions.sub(velocity);
      if (onScreenInstructions.x < -width) { 
        j++; 
        onScreenInstructions.x = width;
      }
    }
    popStyle(); // End of on screen instructions for the player

    if (powerUpScreen || characterSelection) {
      rectMode(CENTER);
      noStroke();
      fill(255, 100);
      rect(halfWidth, halfHeight, windowWidthL, windowHeightL, 50);

      // Windows for the upgrade and character selection screen
      pushStyle();
      noStroke();
      fill(0, 220);
      textFont(upgradeWindowFont, 22);
      textMode(CENTER);

      rect(halfWidth + windowWidthS + 40, halfHeight, windowWidthS, windowHeightS, 50);
      rect(halfWidth, halfHeight, windowWidthS, windowHeightS, 50);
      rect(halfWidth - windowWidthS - 40, halfHeight, windowWidthS, windowHeightS, 50);
      popStyle();

      if (powerUpScreen) { // The code for the upgrade screen, when the player presses P
        if (speed1B) {
          text("Speed Upgrade\n\n Current Level: 1 / 3\nCost: " + speed2Cost + "\nMultiplier: " + speed1, ((halfWidth + windowWidthS) / 2) - (windowWidthS / 2), halfHeight - 50);
        } else if (speed2B) {
          text("Speed Upgrade\n\n Current Level: 2 / 3\nCost: " + speed3Cost + "\nMultiplier: " + speed2, ((halfWidth + windowWidthS) / 2) - (windowWidthS / 2), halfHeight - 50);
        } else if (speed3B) {
          text("Speed Upgrade\n\n Current Level: MAX!!\nMultiplier: " + speed3, ((halfWidth + windowWidthS) / 2) - (windowWidthS / 2), halfHeight - 50);
        } else {
          text("Speed Upgrade\n\n Current Level: 0 / 3\nCost: " + speed1Cost, ((halfWidth + windowWidthS) / 2) - (windowWidthS / 2), halfHeight - 50);
        } // End speed upgrades

        if (jump1B) {
          text("Jump Upgrade\n\n Current Level: 1 / 2\nCost: " + jump2Cost + "\nMultiplier: " + jump1, halfWidth, halfHeight - 50);
        } else if (jump2B) {
          text("Jump Upgrade\n\n Current Level: MAX!!\nMultiplier: " + jump2, halfWidth, halfHeight - 50);
        } else {
          text("Jump Upgrade\n\n Current Level: 0 / 2\nCost: " + jump1Cost, halfWidth, halfHeight - 50);
        } // End jump upgrades

        text("Weapons Upgrade\n\n Coming soon..", (halfWidth + windowWidthS) + 40, halfHeight - 50);
      } // End if(powerUpScreen)

      if (characterSelection) { // Character selection screen, shown when the player presses C. Character abilities stack with the upgrades that the player buys
        // Bill
        pushStyle();
        rectMode(CENTER);
        stroke(0, 255, 0);
        noFill();
        rect((halfWidth + windowWidthS) / 2 - (windowWidthS / 2), halfHeight - 100, playerSize, playerSize);
        popStyle();
        if (avatar1) {
          text("Bill\n\nSelected!", (halfWidth + windowWidthS) / 2 - (windowWidthS / 2), halfHeight);
        } else {
          text("Bill", (halfWidth + windowWidthS) / 2 - (windowWidthS / 2), halfHeight);
        }

        // Sammie
        pushStyle();
        stroke(255, 0, 0);
        fill(255, 0, 0, 150);
        rect(halfWidth, halfHeight - 100, playerSize + 15, playerSize + 15);
        triangle(halfWidth, halfHeight - 100, halfWidth - 50, halfHeight - 140, halfWidth + 50, halfHeight - 140);           
        popStyle();
        if (avatar2) {
          text("Sammie\n\nSelected!", halfWidth, halfHeight);
        } else {
          if (avatar2Unlocked) {
            text("Sammie", halfWidth, halfHeight);
          } else {
            text("Sammie\n\nUnlock cost: " + avatar2Cost, halfWidth, halfHeight);
          }
        } // End sammie

        // Terry
        pushStyle();
        stroke(255);
        fill(255);
        rect(halfWidth + windowWidthS + 40, halfHeight - 100, playerSize, playerSize);
        ellipse(halfWidth + windowWidthS + (playerSize / 2) - 5, halfHeight - 100, playerSize, playerSize);
        ellipse(halfWidth + windowWidthS + (playerSize / 2) + 15, (halfHeight - 100) - (playerSize / 2), playerSize, playerSize);
        fill(0);
        noStroke();
        ellipse(halfWidth + windowWidthS + 50, halfHeight - 105, 12, 12);
        ellipse(halfWidth + windowWidthS + 30, halfHeight - 105, 12, 12);
        popStyle();
        if (avatar3) {
          text("Terry\n\nSelected!", (halfWidth + windowWidthS) + 40, halfHeight);
        } else {
          if (avatar3Unlocked) {
            text("Terry", (halfWidth + windowWidthS) + 40, halfHeight);
          } else {
            text("Terry\n\nUnlock cost: " + avatar3Cost, (halfWidth + windowWidthS) + 40, halfHeight);
          }
        } // End terry

        // Messages that are added above the selected character, giving them some background and information on their specal abilities.
        textAlign(CENTER);
        fill(0, 0, 255);
        stroke(0, 0, 255);
        if (avatar1) {
          text(billy, halfWidth, halfHeight - (windowHeightS / 2) - 40);
        }
        if (avatar2) {
          text(sammie, halfWidth, halfHeight - (windowHeightS / 2) - 40);
        }
        if (avatar3) {
          text(terry, halfWidth, halfHeight - (windowHeightS / 2) - 40);
        }
      } // End character selection
    } // End ingame screens

    if (debugging) {
      fill(255);
      text(frameRate + "FPS", (width - 80), 30);
    }

    noStroke();
    fill(255);
    player.displayStats();
  } // End game play screen

  // Options screen
  void options() {
    clear();
    background(0);
    cursor(CROSS);

    pushStyle();
    fill(255, 0, 0);
    textMode(CENTER);
    textFont(mainMenuFont, 70);
    text("VEX", halfWidth, 100);
    popStyle();

    calcWave();
    renderWave();

    // Options buttons
    stroke(255);
    fill(206, 245, 247);
    textAlign(CENTER);
    textFont(mainMenuFont, 43);
    fill(0);
    noStroke();
    rectMode(CENTER);

    // Framerate button
    fill(0);
    if (mouseX > ((width/2) - (buttonWidth/2) - 50) && mouseX < ((width/2) + (buttonWidth/2) + 50)) {
      if (mouseY > (((height/2) - 150) - (buttonHeight/2)) && mouseY < ((height/2) - 150) + (buttonHeight/2)) {
        fill(128, 128, 128);
      }
    }
    noStroke();
    rect((width/2), (height/2) - 150, buttonWidth + 100, buttonHeight, 25, 25, 25, 25);
    fill(21, 231, 246);

    if (debugging) {
      text("Debugging: On", (width/2), (height/2) - 130);
    } else {
      text("Debugging: Off", (width/2), (height/2) - 130);
    }  

    // Music button
    fill(0);
    if (mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
      if (mouseY > (((height/2) - 50) - (buttonHeight/2)) && mouseY < ((height/2) - 50) + (buttonHeight/2)) {
        fill(128, 128, 128);
      }
    }
    rect((width/2), (height/2) - 50, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21, 231, 246);
    if (musicOPT) {
      text("Music: On", (width/2), (height/2) - 30);
    } else {
      text("Music: Off", (width/2), (height/2) - 30);
    }

    // SFX button
    fill(0);
    if (mouseX > ((width/2) - (buttonWidth/2) - 100) && mouseX < ((width/2) + (buttonWidth/2)) + 100) {
      if (mouseY > (((height/2) + 50) - (buttonHeight/2)) && mouseY < ((height/2) + 50) + (buttonHeight/2)) {
        fill(128, 128, 128);
      }
    }
    rect((width/2), (height/2) + 50, buttonWidth + 200, buttonHeight, 25, 25, 25, 25);
    fill(21, 231, 246);
    if (SFXOPT) {
      text("Sound Effects: On", (width/2), (height/2) + 70);
    } else {
      text("Sound Effects: Off", (width/2), (height/2) + 70);
    }

    // Return to main menu.
    fill(0);
    if (mouseX > ((width/2) - (buttonWidth/2)) && mouseX < ((width/2) + (buttonWidth/2))) {
      if (mouseY > (((height/2) + 150) - (buttonHeight/2)) && mouseY < ((height/2) + 150) + (buttonHeight/2)) {
        fill(128, 128, 128);
      }
    }
    rect((width/2), (height/2) + 150, buttonWidth, buttonHeight, 25, 25, 25, 25);
    fill(21, 231, 246);
    text("Back", (width/2), (height/2) + 170); 

    if (debugging) {
      text(frameRate + "FPS", (width - 80), 30);
    }
  } // End options screen

  // Instructions Screen
  void instructionsScreen() {
    clear();
    background(0);

    // Reads in instructions from instructions.txt
    textAlign(CENTER);
    textFont(instructions, 70);
    fill(255);
    textFont(instructions, 55);
    text(instructionsList[0], halfWidth, 200);
    text(instructionsList[1], halfWidth, 300);
    text(instructionsList[2], halfWidth, 400);
    text(instructionsList[3], halfWidth, 500);
    text(instructionsList[4], halfWidth, 600);

    calcWave();
    renderWave();
  } // End instructions screen

  // Sine wave control.
  void calcWave() {
    theta += 0.02;

    float x = theta;

    for (int i = 0; i < yvalues.length; i++ ) {
      yvalues[i] = sin(x) * amplitude;
      x+=dx;
    }
  }
  void renderWave() {
    noStroke();
    fill(255, 30);

    for (int x = 0; x < yvalues.length; x++ ) {
      ellipse(x*spacing, height/2+yvalues[x], 16, 16);
    }
  } // End renderWave() and sine wave controls
} // End class

