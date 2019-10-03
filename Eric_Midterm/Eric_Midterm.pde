//Eric Price's Midterm Project!
//SOLAR SAILING (game name?)

//Declar Player's Starship
Starship Player;

void setup() {
  size(1920, 1080);
  //fullScreen();
  background(0);
  Player = new Starship();
}

void draw() {
  //resets background
  background(#030303);

    drawStar(236, 255, 50, width/3, height/1.5, width/10);

    drawStar(207, 246, 203, width/1.2, height/6, width/20);

    pushMatrix();

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    popMatrix();

    //status/health/controls/etc bar
    stroke(#4B4A4A);
    strokeWeight(2);
    fill(#818181);
    rect(0, 0, width, height/13); 

    //health bar
    fill(255, 0, 0);
    rect(width/3, height/175, width/3, height/15);

    //health sign
    fill(255);
    textAlign(CENTER);
    textSize(width/50);
    text("Starship Integrity", width/2, height/17);

    //resets stroke values
    strokeWeight(0);
    stroke(0);
  }

  void keyPressed() {
    //moves
    if (key == 'w') {
      Player.thrust = true;
    }
  }

  void keyReleased() {
    //stops 
    if (key == 'w') {
      Player.thrust = false;
    }
  }

  //fun method for making stars easy
  void drawStar(float tempR, float tempG, float tempB, float tempX, float tempY, float dia) {
    //makes ellipse come from center
    ellipseMode(CENTER);
    //sets strokeweight to 0 so no black lines
    strokeWeight(0);
    //ellipses that make up the star
    //(might wanna figure out if I can do a for loop for this)
    stroke(tempR+10, tempG+10, tempB+10);
    fill(tempR+10, tempG+10, tempB+10);
    ellipse(tempX, tempY, dia, dia);
    //2nd ellipse
    stroke(tempR-10, tempG-10, tempB-10);
    fill(tempR-10, tempG-10, tempB-10);
    ellipse(tempX, tempY, dia-15, dia-15);
    //3rd ellipse
    stroke(tempR-20, tempG-20, tempB-20);
    fill(tempR-20, tempG-20, tempB-20);
    ellipse(tempX, tempY, dia-30, dia-30);
    //4th ellipse
    stroke(tempR-35, tempG-35, tempB-35);
    fill(tempR-35, tempG-35, tempB-35);
    ellipse(tempX, tempY, dia-45, dia-45);
    //5th ellipse 
    stroke(tempR-45, tempG-45, tempB-45);
    fill(tempR-45, tempG-45, tempB-45);
    ellipse(tempX, tempY, dia-60, dia-60);
    ellipseMode(CORNER);
  }
