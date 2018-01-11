class Powerup {
  // data
  int rx, ry, rw;
  color boxColor = color(0, 0, 0);
  
  // constructor
  Powerup(int _rx, int _ry, int _rw) {
    rx = _rx;
    ry = _ry;
    rw = _rw;
  }
  
  void display() {
    fill(boxColor);
    stroke(0);
    strokeWeight(2);
    rect(rx, ry, rw, rw);
  }    
}