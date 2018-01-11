class paddle {
  // class for the player paddles
  
  // data
  int x, y, r, r2;

  // constructor
  paddle(int _x, int _y, int _r) {
    // paddle has x, y and a radius
    x = _x;
    y = _y;
    r = _r;
  }

  // behaviours
  void display() {
    //displayes the paddles
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, r, r);
    println(x, y);
  }

  void move(int _moveX, int _moveY) {
    // movement of the paddles
    x = _moveX;
    y = _moveY;

    // keeps the paddle in bounds
    if (x + r> width)  {   
      x = width - r/2;
    } 
    else if (x - r/2 < 0) { 
      x = r/2;
    }

    if (y + r/2 > height) {
      y = height - r/2;
    } 
    else if (y - r/2 < 0) {
      y = r/2;
    }
  }
  
  void powerUpDetection(Powerup box, float x, float y, float r, float sx, float sy, float sw) {
    sx = box.x;
    sy = box.y;
    sw = box.w;
    
    float testX = x;
    float testY = y;
    
    if (x < sx) textX = 
    
    
    
  }
}