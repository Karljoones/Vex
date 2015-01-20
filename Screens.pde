class Screens {
  final int powerUpWindowsAmt = 3;
  
  // Main menu screen
  void mainMenu() {
    clear();
    background(0);
    
    pushStyle();
      fill(255,0,0);
      textMode(CENTER);
      textFont(mainMenuFont, 70);
      text("VEX", halfWidth, 100);
    popStyle();

    cursor(CROSS);

    // Waveform or sine wave depending on the sound options
    if(musicOPT) {
      stroke(255, 50);
      for (int i = 0; i < mainMenuMusic.bufferSize () - 1; i++ )
      {
        line(i, 50 + mainMenuMusic.left.get(i)*150, i + 2, 50 + mainMenuMusic.left.get(i+1)*150);
        line(i, 150 + mainMenuMusic.right.get(i)*150, i + 2, 150 + mainMenuMusic.right.get(i+1)*150);
      } 
    } else {
      calcWave();
      renderWave();
    }

    stroke(255);
    fill(206, 245, 247);
    textAlign(CENTER);
    textFont(mainMenuFont, 43);
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect((width/2), (height/2), (buttonWidth + 10), 420, 25, 25, 25, 25);

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
    
    if(musicOPT) {
      stroke(255, 40);
      for (int i = 0; i < themeSong.bufferSize () - 1; i++ )
      {
        line(i, 50 + themeSong.left.get(i)*150, i + 2, 50 + themeSong.left.get(i+1)*150);
        line(i, 150 + themeSong.right.get(i)*150, i + 2, 150 + themeSong.right.get(i+1)*150);
      }
    } else {
      calcWave();
      renderWave();
    }
    
    // Shows in game when the player uses the P key, shows the available power ups to the player, these upgrades do not stack.
    if(powerUpScreen) {
      rectMode(CENTER);
      noStroke();
      fill(255, 100);
      rect(halfWidth, halfHeight, windowWidthL, windowHeightL, 50);
      
      // Upgrade window
      pushStyle();
        noStroke();
        fill(0, 200);
        textFont(upgradeWindowFont, 22);
        textMode(CENTER);
    
        rect(halfWidth + windowWidthS + 40, halfHeight, windowWidthS, windowHeightS, 50);
        rect(halfWidth, halfHeight, windowWidthS, windowHeightS, 50);
        rect(halfWidth - windowWidthS - 40, halfHeight, windowWidthS, windowHeightS, 50);
       popStyle();
       
        if(speed1B) {
          text("Speed Boost\n\n Current Level: 1 / 3\nCost: " + speed2Cost + "\nMultiplier: " + speed1, ((halfWidth + windowWidthS) / 2) - (windowWidthS / 2), halfHeight - 50);
        } else if(speed2B) {
          text("Speed Boost\n\n Current Level: 2 / 3\nCost: " + speed3Cost + "\nMultiplier: " + speed2, ((halfWidth + windowWidthS) / 2) - (windowWidthS / 2), halfHeight - 50);
        } else if(speed3B) {
          text("Speed Boost\n\n Current Level: MAX!!\nMultiplier: " + speed3, ((halfWidth + windowWidthS) / 2) - (windowWidthS / 2), halfHeight - 50);
        } else {
          text("Speed Boost\n\n Current Level: 0 / 3\nCost: " + speed1Cost, ((halfWidth + windowWidthS) / 2) - (windowWidthS / 2), halfHeight - 50);
        } // End speed upgrades
        
        if(jump1B) {
          text("Jump Boost\n\n Current Level: 1 / 2\nCost: " + jump2Cost + "\nMultiplier: " + jump1, halfWidth, halfHeight - 50);
        } else if(jump2B) {
          text("Jump Boost\n\n Current Level: MAX!!\nMultiplier: " + jump2, halfWidth, halfHeight - 50);
        } else {
          text("Jump Boost\n\n Current Level: 0 / 2\nCost: " + jump1Cost, halfWidth, halfHeight - 50);
        } // End jump upgrades
        
        text("Weapons upgrades\n\nTo be\n added later", (halfWidth + windowWidthS) + 40, halfHeight - 50);
    } // End power up screen.
    
    if (debugging) {
      fill(255);
      text(frameRate + "FPS", (width - 80), 30);
      
      pushStyle();
        stroke(255,255,0, 50);
        line(playerPos.x, 0.0, playerPos.x, height);
        line(0.0, playerPos.y, width, playerPos.y);
        text("X: " + playerPos.x, (width/2)-100, 15);
        text("Y: " + playerPos.y, (width/2)+100, 15);
      popStyle();
    }

    noStroke();
    fill(255);
    player.displayStats();
  } // End game play screen

  // Options screen
  void options() {
    clear();
    background(0);
    
    pushStyle();
      fill(255,0,0);
      textMode(CENTER);
      textFont(mainMenuFont, 70);
      text("VEX", halfWidth, 100);
    popStyle();
    
    // Waveform
    if(musicOPT) {
      stroke(255, 30);
      for (int i = 0; i < mainMenuMusic.bufferSize () - 1; i++ )
      {
        line(i, 50 + mainMenuMusic.left.get(i)*150, i, 50 + mainMenuMusic.left.get(i+1)*150);
        line(i, 150 + mainMenuMusic.right.get(i)*150, i, 150 + mainMenuMusic.right.get(i+1)*150);
      }
    } else {
      calcWave();
      renderWave();
    }

    cursor(CROSS);
    
    // Options buttons
    stroke(255);
    fill(206, 245, 247);
    textAlign(CENTER);
    textFont(mainMenuFont, 43);
    fill(0);
    noStroke();
    rectMode(CENTER);
    rect((width/2), (height/2), (buttonWidth + 210), 420, 25, 25, 25, 25);

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
    background(0);
    
    // Instructions need to be changed when the starter code is implemented into the code.
    textAlign(CENTER);
    textFont(instructions, 70);
    fill(255);
    text("HOW TO PLAY", width/2, height/2-200);
    textFont(instructions, 55);
    text(" Use the RIGHT \n arrow to move \n UP to jump \n P to pause \n M to return to main menu\n KEEP MOVING RIGHT", halfWidth, halfHeight - 100);
    
    if (keyPressed) {
      if (key == 'm' || key == 'M') {
        mainMenu = true;
        instructionsScreen = false;
      }
    }
  } // End instructions screen
  
  // Sine wave control.
  void calcWave() {
    theta += 0.02;
    
    float x = theta;
    
    for(int i = 0; i < yvalues.length; i++ ) {
      yvalues[i] = sin(x) * amplitude;
      x+=dx;
    }
  }
  void renderWave() {
    noStroke();
    fill(255, 30);
    
    for(int x = 0; x < yvalues.length ; x++ ) {
      ellipse(x*spacing, height/2+yvalues[x], 16,16);
    } 
  }
  // End sine wave
  
} // End class

