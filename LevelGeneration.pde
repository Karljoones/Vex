class levelGen{
  
  void work() {
    draw();
    check();
  }
  
  void draw() {
    stroke(255, 0, 0);
    line(line1_start.x, line1_start.y, line1_end.x, line1_end.y);
    line(line2_start.x, line2_start.y, line2_end.x, line2_end.y);
    line(line3_start.x, line3_start.y, line3_end.x, line3_end.y);
    line(line4_start.x, line4_start.y, line4_end.x, line4_end.y);
    line(line5_start.x, line5_start.y, line5_end.x, line5_end.y);
    line(line6_start.x, line6_start.y, line6_end.x, line6_end.y);
    line(line7_start.x, line7_start.y, line7_end.x, line7_end.y);
    line(line8_start.x, line8_start.y, line8_end.x, line8_end.y);
  }
  
  void check() {
    
    // Horizontal
    if(line1_end.x < 0) {
      line1_start.set(line6_end.x, line6_end.y);
      line1_end.set(line1_start.x + random(lineMin, lineMax), line6_end.y);
    }
    
    // Vertical
    if(line2_end.x < 0) {
      line2_start.set(line1_end.x, line1_end.y);
      line2_end.set(line2_start.x, line2_start.y + random(verticalMin, verticalMax));
      while(line2_end.y > height){
        line2_end.y = -random(verticalMax);
      }
      while(line2_end.y < 0) {
        line2_end.y = random(verticalMax);
      }
    }
    
    // Horizontal
    if(line3_end.x < 0) {
      line3_start.set(line2_end.x, line2_end.y);
      line3_end.set(line3_start.x + random(lineMin, lineMax), line3_start.y);
    }
    
    // Vertical
    if(line4_end.x < 0) {
      line4_start.set(line3_end.x, line3_end.y);
      line4_end.set(line4_start.x, line4_start.y + random(verticalMin, verticalMax));
      while(line4_end.y > height){
        line4_end.y = -random(verticalMax);
      } 
      while(line4_end.y < 0) {
        line4_end.y = random(verticalMax);
      }
    }
    
    // Horizontal
    if(line5_end.x < 0) {
      line5_start.set(line4_end.x, line4_end.y);
      line5_end.set(line5_start.x + random(lineMin, lineMax), line5_start.y);
    }
    
    // Vertical
    if(line6_end.x < 0) {
      line6_start.set(line5_end.x, line5_end.y);
      line6_end.set(line6_start.x, line6_start.y + random(verticalMin, verticalMax));
      while(line6_end.y > height){
        line6_end.y = -random(verticalMax);
      } 
      while(line6_end.y < 0) {
        line6_end.y = random(verticalMax);
      }
    }
    
    // Horizontal
    if(line7_end.x < 0) {
      line7_start.set(line6_end.x, line6_end.y);
      line7_end.set(line7_start.x + random(lineMin, lineMax), line7_start.y);
    }
    
    // Vertical
    if(line8_end.x < 0) {
      line8_start.set(line7_end.x, line7_end.y);
      line8_end.set(line8_start.x, line8_start.y + random(verticalMin, verticalMax));
      while(line8_end.y > height){
        line8_end.y = -random(verticalMax);
      } 
      while(line8_end.y < 0) {
        line8_end.y = random(verticalMax);
      }
    }
  } // End check()
  
} // End class
