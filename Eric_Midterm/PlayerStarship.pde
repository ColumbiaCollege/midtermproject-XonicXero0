class Starship {

  //properties 

  //variables for position
  float playerX =0;
  float playerY =0;

  boolean thrust = false;

  //Constructor 
  Starship() {
    //initial position
    playerX = width/2;
    playerY = height/2;
  }

  //methods 

  void playerMove() {

    //movement

    //
    float targetX = mouseX;

    //
    float targetY = mouseY;

    if (thrust) {
      if (playerX > targetX) {
        playerX-=2;
      }  
      if (playerX < targetX) {
        playerX+=2;
      } 

      if (playerY > targetY) {
        playerY-=2;
      }  
      if (playerY < targetY) {
        playerY+=2;
      }
    }

    //code that makes it so player cannot go behind/under status bar
    if (playerY < height/13) {
      playerY = height/13;
    }
  }

  void playerDraw() {

    //makes ship face the mouse at all times (gotten mainly from API)
    translate(playerX, playerY);
    float a = atan2(mouseY-playerY, mouseX-playerX);
    rotate(a);

    //modes for players starship drawing
    ellipseMode(CENTER);
    noStroke();

    //fuel tanks
    fill(#A74507);
    ellipse(0, 0, 23, 15);

    //starship body
    fill(#DEDEDE);
    triangle(-7, -7, -7, 7, 25, 0);
    triangle(-7, -12, -7, 12, 7, 0);
    triangle(-7, -12, -7, 12, -9, 0);

    //thrust if ship is moving 
    if (thrust) {
      fill(#FF9864);
      triangle(-12, -7, -12, 7, -25, 0);
      fill(#F08C22);
      triangle(-11, -5, -11, 5, -23, 0);
    }

    //thruster
    fill(#2C2C2C);
    triangle(-6, -7, -14, -8, -14, 8);
    triangle(-6, 7, -14, -8, -14, 8);

    //cockpit
    fill(#C1C106);
    triangle(5, 0, -4, -4, -4, 4);

    //resets modes
    ellipseMode(CORNERS);
    stroke(0);

    //println();
  }
}
