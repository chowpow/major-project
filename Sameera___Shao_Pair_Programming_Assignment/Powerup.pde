class Powerup {
  // data
  int x, y, w;
  color boxColor = color(255, 0, 0);
  
  // constructor
  Powerup(int _x, int _y, int _w) {
    x = _x;
    y = _y;
    w = _w;
  }
  
  void display() {
    fill(boxColor);
    stroke(0);
    strokeWeight(2);
    rect(x, y, w, w);
  }    
}