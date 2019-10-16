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
  int dia;

  //constructor 
  StarDebris(int _S, int _D) {
    xPos       = -20;
    yPos       = random(0, height);
    desiredX   = width + 20;
    desiredY   = random(0, height);
    angle      = atan2(desiredY - yPos, desiredX - xPos);
    speed      = _S;
    dia        = _D;
    placeHolder = loadImage("Asteroid.png");
  }

  //Creating the Asteroid
  void DrawAsteroid() {
    placeHolder.resize(dia, dia);
    image(placeHolder, xPos, yPos);
  }

  //Asteroid Moving 
  void MoveAsteroid() {
    xPos += speed*cos(angle);
    yPos += speed*sin(angle);
  }

  //Out of Bounds Condition 
  boolean OutOfBounds() {
    return xPos >= width+40;
  }
}
