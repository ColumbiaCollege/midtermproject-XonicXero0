class Starship {

  //properties 

  //variables for position
  float playerX =0;
  float playerY =0;
  //variable for player speed
  float a;
  float playerSpeed;
  //variables for UI(Health, Energy, and Resources)(Not USED YET)
  float playerHealth;
  float playerEnergy;
  float playerCash;
  float playerAmmo;
  float playerOre;
  float playerKnowledge;
  //booleans for ship movement 
  boolean thrust = false;
  boolean boost = false;


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

    //player speed when thrusting
    if (thrust) {
      playerSpeed = 1;
    }

    //player speed when boosting 
    if (boost) {
      playerSpeed = 3;
    }

    //code that makes the ship move to the mouse position when thrusters are activated
    //weird pausing issue && abs( targetX - playerX ) > 1 && abs( targetY - playerY ) > 1 
    if (thrust) {
      playerX += playerSpeed*cos(a);
      playerY += playerSpeed*sin(a);
    }

    //code that makes it so thrust does not appear when destination isnt reached (not working 100%)
    //if ( abs( targetX - playerX ) < 1 && abs( targetY - playerY ) < 1  ) {
    //thrust = false;
    //boost = false;
    //}

    //code that makes it so player cannot go behind/under status bar
    if (playerY < height/13) {
      playerY = height/13;
    }
  }

  void playerDraw() {

    pushMatrix();

    //makes ship face the mouse at all times (gotten mainly from API)
    translate(playerX, playerY);
    a = atan2(mouseY-playerY, mouseX-playerX);
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

    //super thrust is the ship is boosting 
    if (thrust && boost) {
      fill(#CEFBFF);
      triangle(-12, -7, -12, 7, -30, 0);
      fill(#83F4FF);
      triangle(-11, -5, -11, 5, -25, 0);
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

    popMatrix();

    //println();
     //Player Starship Info! (Currancy, Health, Energy, ETC.)

  //status/health/controls/etc bar
  stroke(#4B4A4A);
  strokeWeight(2);
  fill(#818181);
  rect(0, 0, width, height/13); 

  //SYSTEM INFO
  fill(200);
  rect(width/3, height/175, width/3, height/15);

  //SYSTEM NAME
  fill(255);
  textAlign(CENTER);
  textSize(width/50);
  text(SA, width/2, height/17);

  //health bar
  fill(255, 0, 0);
  rect(width/1.34, height/175, width/4, height/35);
  //energy bar
  fill(0, 100, 255);
  rect(width/1.34, height/25, width/4, height/35);

  //resets stroke values
  strokeWeight(0);
  stroke(0);
  }
}
