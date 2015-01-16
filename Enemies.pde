class Enemy {
  
  // This is the finite amount of enemies that can be on the screen at any one moment.
  final int enemyCount = 5;
  String type;
  int amt, enemyDelay;
  
  // Spawn rates of the enemies. Will need to be changed at a later date to be configured efficently. 
  final float crushingBlockChance = 0.33, shooterChance = 0.33, soldierChance = 0.33;
  
  // Constructor
  Enemy() {
    amt = 0;
    type = "soldier";
    enemyDelay = (int)random(2,7);
  }
  
  void nameGenerateEnemy() {
    load.loadTextFiles(); // this loads in the two name files for the names of the enemies.
    
    
  } // End nameGenerateEnemy()
  
  void generateEnemy(String type) {
    if(type == "crushing block") {
      rect(random(0,width), 0, random(20,200), -1000); // This is going to be a block that comes right down on the players head and crushes them
    } 
    if(type == "shooter") {
      // Fire at the player
    }
    if(type == "soldier") {
      pCollision.enemyCollision();
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
    if(type == "soldier") {
    
    }
  }
} // End class


