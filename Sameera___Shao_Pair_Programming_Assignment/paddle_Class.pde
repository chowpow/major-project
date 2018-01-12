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
    ellipse(x, y, r*2, r*2);
   
    println(r);
  }

  void move(int _moveX, int _moveY) {
    // movement of the paddles
    x = _moveX;
    y = _moveY;

    // keeps the paddle in bounds
    if (x + r*2> width) {   
      x = width - r;
    } else if (x - r < 0) { 
      x = r;
    }

    if (y + r > height) {
      y = height - r;
    } else if (y - r < 0) {
      y = r;
    }
  }

  boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw) {

    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rw) testY = ry+rw;   // bottom edge

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return true;
    }
    return false;
  }
  
  void boxCollision(Powerup blackBox) {
    boolean hit = circleRect(x,y,r,blackBox.rx,blackBox.ry,blackBox.rw);
    if (hit) {
      blackBox.boxColor = color(255, 0, 0);
    } else {
      blackBox.boxColor = color(0);
    }
  }
}