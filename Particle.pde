// Particle system

class Particle {
  PVector location;
  PVector velocity;
  PVector aceleration;
  float lifespan;
  
  // Constructor
//  Particle(PVector l){
//    location = l.get();
//    aceleration = new PVector();
//    velocity = new PVector();
//    lifespan = 255;
//  } 
  
  void update() {
    velocity.add(aceleration);
    location.add(velocity);
    lifespan -= 2.0;
  } // End update
  
  void display() {
    stroke(0, lifespan);
    fill(175, lifespan);
    ellipse(location.x,location.y,8,8);
  } // End display
  
} // End class
