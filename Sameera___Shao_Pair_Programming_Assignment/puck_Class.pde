class Puck {
  
  // data
  ArrayList<paddle> paddles;  
  PImage ballImage;
  int x, y; 
  float spring = 0.08;  
  float friction = -0.7;
  int vy = 0, vx = 0;
  
  int score1 = 0;
  int score2 = 0;
  boolean goal = false;

  float ballRadius;
  int puckX, puckY;

  // constructor
  Puck(int _x, int _y, ArrayList _paddles) {
    ballImage = loadImage("will.png");//loads the soccer ball
    puckX = _x; //x cord
    puckY = _y; // y cord
    ballRadius = (ballImage.width * 0.05) / 2; //scaling down
    paddles = _paddles; //renaming the array list
  }

  void display() { 
    // displays the "puck", the image of the score ball
    imageMode(CENTER);
    fill(255, 200, 0);
    strokeWeight(.1);
    image(ballImage, puckX, puckY, ballRadius * 2, ballRadius * 2);
  }

  void hit(Nets gameNet) {
    for (int i = 0; i < paddles.size(); i++) {
      // collision detection between the paddles and the puck
      float dx = paddles.get(i).x - puckX; //paddles x co-ords to be changed
      float dy = paddles.get(i).y - puckY;  //paddles y co-ords to be changed
      float distance = sqrt(dx*dx + dy*dy);//distance between the two objects
      float minDist = (p1.r) + (p1.r);

      // If our paddles hit the puck
      if (distance < minDist) {
        //determines the angle of the puch rebound. 
        float angle = atan2(dy, dx);
        float targetX = puckX + cos(angle) * (minDist);
        float targetY = puckY + sin(angle) * (minDist);
        
        //the speed of the puck movement
        float ax = (targetX - puckX) * spring;
        float ay = (targetY - puckY) * spring;
        vx -= ax;
        vy -= ay;
      }

      // Adds movement to puck by increasing or decreasing X/Y values
      puckX += vx;
      puckY += vy;
    } 

     //Ensure it doesnt go off the X axis UNLESS its a goal
    if (puckX + ballRadius > width) 
    {
       //if the puck is not between the nets and, it hits the right side of the screen, the puck bounces, back with a slower speed
      if ( puckY < height - (2*gameNet.netHeight) || puckY > height - gameNet.netHeight)
      {
        //slows down the puck
        puckX = width - int(ballRadius);
        vx *= friction;
      } 
      //if the puck goes in the nets, speed becomes zero, repositions the puck to the center, a new round of game starts
      else {
        score1++;

        puckX = width/2;
        puckY = height/2;
        vy = 0;
        vx = 0;
      }
    } 
    
    //checks the rebound from the left side of the screen, and if it does, rebounds with a slower spped
    else if (puckX - int(ballRadius) < 0) {
      //if the puck doensn't go in the net
      if ( puckY < height - (2* gameNet.netHeight) || puckY > height - gameNet.netHeight)
      {
        
        //slows down the puck
        puckX = 0 + int(ballRadius);
        vx *= friction;
        
      //if the puck goes in the nets, speed becomes zero, repositions the puck to the center, a new round of game starts
      } 
      else{
        score2++;

        puckX = width/2;
        puckY = height/2;
        vy = 0;
        vx = 0;
      }
    }

    // Ensure it doesnt go off the Y axis
    if (puckY + int(ballRadius) > height) 
    {

      puckY = height - int(ballRadius);
      vy *= friction;
    } else if (puckY - int(ballRadius) < 0) 
    {

      puckY = int(ballRadius);
      vy *= friction;
    }
  } 

  // returns the scores
  int score1()
  {
    return score1;
  } 

  int score2()
  {
    return score2;
  }
}