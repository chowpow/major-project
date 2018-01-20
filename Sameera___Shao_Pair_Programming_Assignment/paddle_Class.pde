class paddle {
  // class for the player paddles

  // data
  int x, y, r, powerUpPoint1, powerUpPoint2;
  

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
  }

  void move(int _moveX, int _moveY) {
    // movement of the paddles
    x = _moveX;
    y = _moveY;

    // keeps the paddle in bounds
    if (x + r/2> width) {   
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
  
  void specialP1(Puck pucks, char key1, char key2, char key3, char key4) {
    // special moves for player 1
    if (powerUpPoint1 >= 1) {
      if (keyPressed) { 
        if (key == key1) {
          pucks.spring = 0.2;
          powerUpPoint1--;
        }
        if (key == key2) {
          puck.spring = 0.02;
          powerUpPoint1--;
        }
        if (key == key3) {
          puck.ballRadius = (puck.ballImage.width * 0.08) /2;
          powerUpPoint1--;
        }
        if (key == key4) {
          puck.ballRadius = (puck.ballImage.width * 0.02) / 2;
          powerUpPoint1--;
        }
      }
    }
  }
  
  void specialP2(Puck pucks, char key1, char key2, char key3, char key4) {
    // special moves for player 2
    if (powerUpPoint2 >= 1) {
      if (keyPressed) { 
        if (key == key1) {
          pucks.spring = 0.2;
          powerUpPoint2--;
        }
        if (key == key2) {
          puck.spring = 0.02;
          powerUpPoint2--;
        }
        if (key == key3) {
          puck.ballRadius = (puck.ballImage.width * 0.08) /2;
          powerUpPoint2--;
        }
        if (key == key4) {
          puck.ballRadius = (puck.ballImage.width * 0.02) / 2;
          powerUpPoint2--;
        }
      }
    }
  }
}