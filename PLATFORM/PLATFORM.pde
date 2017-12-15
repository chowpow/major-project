char[][] tiles;
PImage platform, empty, levelBackground;
int tilesHigh, tilesWide;
float tileWidth, tileHeight;
String bgImage, levelToLoad;

void setup() {
  size(800, 600);
  levelToLoad = "levels/0.txt";
  bgImage = "bg.png";

  initializeValues();
}

void draw() {
  display();
}

void intializeValues() {
  loadImages();
  
  String lines[] = loadStrings(levelToLoad);
  
  tilesHigh = lines.length;
  tilesWide = lines[0].length();
  
  tileWidth = width/tilesWide;
  tileHeight = height/tilesHigh;
  
  tiles = new char[tilesWide][tilesHigh];
  
  for (int y = 0; y < tilesHigh; y++) {
    for (int x = 0; x < tilesWide; x++) {
      char tileType = lines[y].charAt(x);
      tiles[x][y] = tileType;
    }
  }
}

void showTile(char location, int x, int y) {
  if (location == '#') {
    image(platform, x*tileWidth, y*tileHeight, tileWidth, tileHeight);
  }
}

void loadImages() {
  levelBackGround = loadImage(bgImage);
  
  platform = loadImage("0.png");
}

void display() {
  image(levelBackground, 0, 0, width, height);
  
  for (int y = 0; y < tilesHigh; y++) {
    