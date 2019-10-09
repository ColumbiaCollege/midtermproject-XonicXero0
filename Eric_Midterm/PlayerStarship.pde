class Starship {

  //variables 
  //booleans for ship movement
  boolean thrust = false;
  boolean boost = false;


  //Constructor 
  Starship() {
  }

  //methods 

  void playerMove() {

    //movement

    //player speed when thrusting and energy cost
    if (thrust) {
      playerSpeed = width/1000; 
      playerEnergy = playerEnergy - 0.001;
    }

    //player speed when boosting and energy cost
    if (boost) {
      playerSpeed = width/500;
      playerEnergy = playerEnergy - 0.005;
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

  void playerUI() {
    //Player Starship Info! (Currancy, Health, Energy, ETC.

    //health/energy bar progress

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
    //sI
    text(sI, width/2, height/17);

    //health bar
    stroke(#4B4A4A);
    strokeWeight(4);
    fill(#818181);
    rect(width/1.34, height/175, width/4, height/35);
    strokeWeight(0);
    stroke(0);
    fill(255, 0, 0);
    rect(width/1.34, height/175, playerHealth/100*width/4, height/35);

    //energy bar
    stroke(#4B4A4A);
    strokeWeight(4);
    fill(#818181);
    rect(width/1.34, height/25, width/4, height/35);
    strokeWeight(0);
    stroke(0);
    fill(0, 100, 255);
    rect(width/1.34, height/25, playerEnergy/100*width/4, height/35);

    //resource bars 
    stroke(#4B4A4A);
    strokeWeight(2);
    fill(#767675);
    rect(width/175, height/175, width/4, height/15);

    //Player Cash display
    textSize(width/100);
    fill(0);
    text("Cash", width/50, height/45); 
    text(playerCash, width/15, height/45);

    //Player Ore display
    textSize(width/100);
    fill(0);
    text("Ore", width/50, height/22);
    text(playerOre, width/15, height/22);

    //player Data sisplay
    textSize(width/100);
    fill(0);
    text("Data", width/50, height/15);
    text(playerData, width/15, height/15);

    strokeWeight(0);
    stroke(0);
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
   //println(playerX);
  }
}
