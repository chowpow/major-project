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
    if (x + r> width) {   
      x = width - r/2;
    } else if (x - r/2 < 0) { 
      x = r/2;
    }

    if (y + r/2 > height) {
      y = height - r/2;
    } else if (y - r/2 < 0) {
      y = r/2;
    }
  }

  void powerUpDetection(Powerup box) {
    // temporary variables to set edges for testing
    float testX = x;
    float testY = y;

    // which edge is closest?
    if (x < box.x)         testX = box.x;      // test left edge
    else if (x > box.x+box.w) testX = box.x+box.w;   // right edge
    if (box.y < box.y)         testY = box.y;      // top edge
    else if (box.y > box.y+box.w) testY = box.y+box.w;   // bottom edge

    // get distance from closest edges
    float distX = x-testX;
    float distY = y-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      box.boxColor = color(0);
    }
   
  }
}