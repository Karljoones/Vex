class Enemy {
  
  // This is the finite amount of enemies that can be on the screen at any one moment.
  final int enemyCount = 5;
  String type;
  int amt;
  
  // Spawn rates
  final float crushingBlockChance = 0.33, shooterChance = 0.33;
  
  // Constructor
  Enemy() {
    amt = 0;
    type = "random";
  }
  
  void nameGenerateEnemy() {
    load.loadTextFiles();
  } // End nameGenerateEnemy()
  
  void generateEnemy(String type) {
    if(type == "crushing block") {
      rect(random(0,width), 0, random(20,200), -1000);
    } 
    if(type == "shooter") {
      // Fire at the player
    }
    if(type == "random") {
      // Choose a random enemy to throw at the player
    }
  }
  
  void move() {
    // Enermy movement here.
  }
  
  void draw() {
    if(type == "crushing block") {
      
    }
    if(type == "shooter") {
      
    }
  }
} // End class


