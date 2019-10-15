class StarDebris {
//big thanks to drake for helping me understand arraylist and other concepts needed for this

  //variables 
  PImage placeHolder;
  float xPos;
  float yPos;
  float desiredX;
  float desiredY;
  float angle;
  int speed;
  int aSize;

  //constructor 
  StarDebris(int _S, int _AS) {
    xPos       = -20;
    yPos       = random(0, height);
    desiredX   = width + 20;
    desiredY   = random(0, height);
    angle      = atan2(desiredY - yPos, desiredX - xPos);
    speed      = _S;
    aSize      = _AS;
  }

  //Creating the Asteroid
  void DrawAsteroid() {
    //image removed for framerate issues
    //placeHolder = loadImage("Asteroid.png");
    //placeHolder.resize(aSize, aSize);
    //image(placeHolder, xPos, yPos);
    fill(#EABB80);
    ellipse(xPos,yPos,aSize,aSize);
  }

  //Asteroid Moving 
  void MoveAsteroid() {
    xPos += speed*cos(angle);
    yPos += speed*sin(angle);
  }
  
    //player takes damage when hitting Asteroid
  void ContactAsteroid() {
    float disX = xPos - Player.X;
    float disY = yPos - Player.Y;
    if (sqrt(sq(disX) + sq(disY)) < aSize/2 ) {
      Player.Health = Player.Health - 1;
    }
  }

  //Out of Bounds Condition 
  boolean OutOfBounds() {
    return xPos >= width+40;
  }
}
