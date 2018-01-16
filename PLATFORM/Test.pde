class Test {
  PImage[] cat = new PImage[6];
  int catCounter;
  float x, y;
  
  Test() {

    catCounter = 0;

    for (int i=0; i<cat.length; i++) {
      cat[i] = loadImage( i + ".png");
    }
  }
  
  void display(float x, float y) {
    image(cat[catCounter], x, y);
    if (frameCount % 5 == 0) {
      catCounter++;
      catCounter = catCounter % cat.length;  //don't fall off the end of the array
    }
  }
}
  
    
    