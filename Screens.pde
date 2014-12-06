// This class is used to control the splash screens of the game

class Screens {
 
 void mainMenu() {
    clear();
    background(0);
    stroke(255);
    fill(222,184,135);
    rectMode(CENTER);
    rect((width/2), (height/2), 300, 400, 25, 0, 25, 0);
    fill(0);
    noStroke();
    rect((width/2), (height/2) - 150, 290, 90, 25, 0, 25, 0);
    rect((width/2), (height/2) - 50, 290, 90, 25, 0, 25, 0);
    rect((width/2), (height/2) + 50, 290, 90, 25, 0, 25, 0);
    rect((width/2), (height/2) + 150, 290, 90, 25, 0, 25, 0);
 } 
  
}
