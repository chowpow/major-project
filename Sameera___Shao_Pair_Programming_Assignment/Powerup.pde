class Powerup {
  // data
  int x, y, w;
  
  // constructor
  Powerup(int _x, int _y, int _w) {
    x = _x;
    y = _y;
    w = _w;
  }
  
  void display() {
    fill(0, 0, 0, 55);
    stroke(0);
    strokeWeight(2);
    rect(x, y, w, w);
  }    
}