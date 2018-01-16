class Powerup {
  // data
<<<<<<< HEAD
  int rx, ry, rw;
  color boxColor = color(0, 0, 0);
=======
  int x, y, w;
>>>>>>> parent of 7830eb1... Attempted Collision Detection
  
  // constructor
  Powerup(int _rx, int _ry, int _rw) {
    rx = _rx;
    ry = _ry;
    rw = _rw;
  }
  
  void display() {
    fill(0, 0, 0, 55);
    stroke(0);
    strokeWeight(2);
    rect(rx, ry, rw, rw);
  }    
}