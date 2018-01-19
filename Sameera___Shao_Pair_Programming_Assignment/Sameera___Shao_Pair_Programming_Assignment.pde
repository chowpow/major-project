ArrayList<paddle> paddles = new ArrayList();

// Class Types
Puck puck;
paddle p1, p2;
Nets net1, net2;

// Booleans
boolean paused = false;
boolean inPlay = false;
boolean menu = true;
boolean movingUp, movingDown, movingRight, movingLeft;

// First Menu variables
String title = "Air Basketball";
String creater = "By Shao & Sameera";
String start = "Play";

// Paddle Variables
int radius = 90;

// Puck Variables 
int puckX;
int puckY;
int centerX, centerY, rectX, rectY;
int goalTop, goalBottom, goalLeft, goalRight, goalWidth, goalHeight;

//background images
PImage floorm, menuBg;

float BX, BY;

//font 
PFont scoreBoard;

// Button Variables
float bx;
float by;
int buttonW = 75;
int buttonH = 40;
boolean overBox = false;
int opacity;

int player2MoveX = 800;
int player2MoveY = 500;
int DX = 5;
int DY = 5;
PImage bg, lebron, curry, jordan;
PFont basket, halo;
int curryX, curryY, lebronX, lebronY;


void setup()
{
  size(1000, 600);

  movingUp = false;
  movingDown = false;
  movingRight = false;
  movingLeft = false;
  curryX =650;
  curryY = 50;
  lebronX = 50;
  lebronY = 150;

  centerX = width/2;
  centerY = 0;
  rectX = -3;
  rectY = 250;

  goalWidth = 40;
  goalHeight = 100;
  goalTop = 0;
  goalLeft = 247;
  goalRight  = goalLeft + goalWidth;
  goalBottom= goalTop + goalHeight;

  // Place puck at center
  puck = new Puck(width/2, height/2, paddles);

  // Create 2 paddles
  p1 = new paddle(0, height/2, radius);
  p2 = new paddle(player2MoveX, player2MoveY, radius);

  net1 = new Nets(0, height/2, 50, 200);
  net2 = new Nets(width, height/2, 50, 200);

  // Add them to an array
  paddles.add(p1);
  paddles.add(p2);
  
 

  // Sort font
  scoreBoard = loadFont("OCRAStd-48.vlw");
  textFont(scoreBoard);

  // Set button location
  bx = width/2;
  by = height/1.5;
  bg = loadImage("bg.jpg");
  menuBg = loadImage("menu.jpg");
  curry = loadImage("curry.png");
  jordan = loadImage("jordan.png");
  lebron = loadImage("lebron.png");
  basket = createFont("basket.ttf", 70);
  halo = createFont("halo.ttf", 55);
}

void draw() {  
  
  noCursor();
  if (menu)
  {
    menuSetup();
    image(curry, curryX, curryY);
    image(lebron, lebronX, lebronY, lebron.width * 0.5, lebron.height *.5);
    cursor(HAND);
  }

  // In game mode
  if (!menu)
  { 
    move();
    gamePlaySetup();
    noCursor();
  }
}
void move() {
  
  //moves player 2, up, down, right, or left, and constrains the x value only to the right half
  if (movingUp == true) {
    player2MoveY -= DY;
    if (player2MoveY<radius/2)
    {
      player2MoveY = radius/2;
    }
  }
  
  if (movingDown == true) {
    player2MoveY += DY;
    if (player2MoveY>height-(radius/2))
    {
      player2MoveY = height-(radius/2);
    }
  }
  
  if (movingLeft == true) {
    player2MoveX -= DX;
    if (player2MoveX<width/2+(radius/2))
    {
      player2MoveX = width/2+(radius/2);
    }
  }
  
  if (movingRight == true) {
    player2MoveX += DX;
    if (player2MoveX>width-(radius/2))
    {
      player2MoveX = width-(radius/2);
    }
  }
}

void keyPressed() {
  //booleans to check the directions of the movement. only true when WASD are pressed
  if (key == 'W' || key == 'w') {
    movingUp = true;
  }
  if (key == 'S' || key == 's') {
    movingDown = true;
  }
  if (key == 'A' || key == 'a') {
    movingLeft = true;
  }
  if (key == 'D' || key == 'd') {
    movingRight = true;
  }
}

void keyReleased() {
  //booleans are false when WASD are not pressed
  if (key == 'W' || key == 'w') {
    movingUp = false;
  }
  if (key == 'S' || key == 's') {
    movingDown = false;
  }
  if (key == 'A' || key == 'a') {
    movingLeft = false;
  }
  if (key == 'D' || key == 'd') {
    movingRight = false;
  }
}


void drawPitch() {
  background(bg);//floor
  
  stroke(0);
  strokeWeight(3);
  noFill();
  
  //lines on the court
  ellipse(0, 300, 400, 400);
  ellipse(width-25, 300, 400, 400);
  ellipse(centerX, height/2, 180, 180);
  line(centerX, centerY, centerX, centerY + height);
  rect(0, 300, 300, 96);
  rect(width, 300, 300, 96);
}

//Menu screen
void menuSetup() {
  
  background(menuBg);//menu wallpaper

  // checks if the cursor is on the Play Button
  if (mouseX > bx-buttonW && mouseX < bx+buttonW && 
    mouseY > by-buttonH && mouseY < by+buttonH) 
  {
    overBox = true;
  } else {
    overBox = false;
  }

  // Main title with text
  textAlign(CENTER);
  textSize(70);
  fill(255);
  text(title, width/2, height/4); 

  //creators' names
  textFont(scoreBoard);
  textSize(15);
  fill(255);
  fill(250, 149, 48);
  text(creater, width/2, 250);

  //transparent start button
  noFill();
  noStroke();
  rect(bx, by, buttonW, buttonH);

  //changes the font size if the cursor is within the Start button boundaries
  if (overBox) {
    textSize(75);
  } else {
    textSize(43);
  }

  fill(48, 250, 86);
  text(start, bx, by);//Text "start"
}

void drawGoals() {
  // goals
  rectMode(CENTER);
  fill(255, 0, 0, 180);
  rect(0, height/2, 50, 200); 
  fill(255, 0, 0, 180);
  rect(width, height/2, 50, 200); 

  // scoreboard 
  textAlign(CENTER);
  textSize(30);
  fill(0);
  
  //scoreboard
  int score1 = puck.score1();
  text("Player 1\n"+score1, width/4, 50); 
  int score2 = puck.score2();
  text("Player 2\n"+score2, width*.75, 50);
}

void gamePlaySetup() {
  // draws the pitch and displays the paddles
  drawPitch();
  p1.display(); 
  p1.special(puck, '1', '2', '3');
  p2.display();   
  p2.special(puck, 'r', 't', 'y');

  // paddle movement
  p1.move(mouseX, mouseY);
  p2.move(player2MoveX, player2MoveY); 

  // constrain the paddles at half
  if (p1.x>width/2-(radius/2)) { 
    p1.x=width/2-(radius/2);
  }

  if (p2.x<width/2-(radius/2)) { 
    p2.x=width/2-(radius/2);
  }

  // draw Puck
  puck.display();

  // puck Strike
  puck.hit(net1);

  // draw goals
  drawGoals();
  int score1 = puck.score1();
  int score2 = puck.score2();
  


  if (score1 == 10 || score2 == 10) {   
    // if either scores reaches 5 then show menu screen
    if (score1>score2) {
      // text if player 1 wins 
      title="PLAYER 1 WINS";
      creater="";
      start="Again?";
      
      //resets scores
      puck.score1 = 0;
      puck.score2 = 0;
      puck.ballRadius = puck.ballImage.width * 0.05 /2;
      menu = true;
      imageMode(CORNER);
    } 
    
    else {
      // text if player 2 wins
      title="PLAYER 2 WINS";
      creater="";
      start="Again?";
      
      //resets scores
      puck.score1 = 0;
      puck.score2 = 0;
      puck.ballRadius = puck.ballImage.width * 0.05 /2;
      menu = true;
      imageMode(CORNER);
    }
  }
}

//checks whether the mouse is on top of play button
void mousePressed() {
  if (overBox) { 
    menu=false;
  }
}