// Not implemented

class Enemy {
  final int enemyCount = 5;       // This is the maximum amount of enemies that can be spawned at any one time.
  String type;
  int amt, enemyDelay, soldierSpeed = 30, curEnemySpeed;

  // Spawn rates of the enemies. Will need to be changed at a later date to be configured efficently.
  final float crushingBlockChance = 0.12, shooterChance = 0.33, soldierChance = 0.66; // Soldier is the most common enemy, this will just try to attack the player, it has no weapons just tries to attack the player with brute force

  Enemy() {
    this("soldier");
  }

  Enemy(String type) {
    amt = 0;
    this.type = type;
    enemyDelay = (int)random(2, 7);
    enemyPos = new PVector(width - 100, 100);
  }

  void spawnEnemy() {
    if (playerScore % 500 == 0) {
      generateEnemy("soldier");
      enemies.add(new Enemy("soldier"));
    }
  }

  void generateEnemy(String type) {
    if (type == "crushing block") {
      rect(random(0, width), 0, random(20, 200), -1000); // This is going to be a block that comes right down on the players head and crushes them
    } 
    if (type == "shooter") {
      // Fire at the player
    }
    if (type == "soldier") {
      pCollision.enemyCollision(); // Not yet implemented

      fill(255, 0, 0);
      noStroke();
      rect(enemyPos.x, enemyPos.y, playerSize, playerSize);
      move("soldier");
    }
    if (type == "random") {
      // Choose a random enemy to throw at the player. Not yet implemented.
    }
  }

  void move(String type) {
    if (type == "soldier") {
      enemyPos.sub(velocity);
      curEnemySpeed = soldierSpeed;

      if (enemyPos.y < 0) {
        curEnemySpeed += soldierSpeed;
      } else {
        curEnemySpeed -= soldierSpeed;
      }

      enemyPos.y += curEnemySpeed;
    }
  }

  void draw() {
    if (type == "crushing block") {
    }
    if (type == "shooter") {
    }
    if (type == "soldier") {
    }
  }
} // End class

