class Nets {
  // class for the two nets
  
  // data
  int netX, netY, netWidth, netHeight;

  // constructor
  Nets(int _netX, int _netY, int _netWidth, int _netHeight) {
    // net has x, y, width and height values
    netX = _netX;
    netY = _netY;
    netWidth = _netWidth;
    netHeight = _netHeight;
  }
  
  // behaviour
  void display() {
    //displays the nets
    fill(255,0,0,180);
    rect(netX, netY, netWidth, netHeight);
  }
}
    