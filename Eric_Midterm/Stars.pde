class Star {

  //properties
  float xPos;
  float yPos;
  float dia;
  float tempR;
  float tempG;
  float tempB;

  //constructor 
  Star( float _X, float _Y, float _D, float _R, float _G, float _B) {
    xPos  = _X;
    yPos  = _Y;
    dia   = _D;
    tempR = _R;
    tempG = _G;
    tempB = _B;
  }

  //methods for normal stars

  //allows for selection of stars in the warp menu
  void warpStar(int s) {
    float disX = xPos - mouseX;
    float disY = yPos - mouseY;
    if (mousePressed && sqrt(sq(disX) + sq(disY)) < dia/2 ) {
      systems = s;
    }
  }

  //player takes damage when hitting Star
  void ContactStar() {
    if (dist(Player.X, Player.Y, xPos, yPos) <= dia/2 + Player.ShipSize/3) {
      Player.Health = Player.Health - .5;
    }
  }

  //fun method for making stars easy
  void drawStar() {
    //makes ellipse come from center
    ellipseMode(CENTER);
    //sets strokeweight to 0 so no black lines
    strokeWeight(0);
    //ellipses that make up the star
    //(might wanna figure out if I can do a for loop for this)
    stroke(tempR, tempG, tempB);
    fill(tempR, tempG, tempB);
    ellipse(xPos, yPos, dia, dia);
    //2nd ellipse
    stroke(tempR+10, tempG+10, tempB+10);
    fill(tempR+10, tempG+10, tempB+10);
    ellipse(xPos, yPos, dia/1.2, dia/1.2);
    //3rd ellipse
    stroke(tempR+20, tempG+20, tempB+20);
    fill(tempR+20, tempG+20, tempB+20);
    ellipse(xPos, yPos, dia/1.5, dia/1.5);
    //4th ellipse
    stroke(tempR+35, tempG+35, tempB+35);
    fill(tempR+35, tempG+35, tempB+35);
    ellipse(xPos, yPos, dia/1.7, dia/1.7);
    //5th ellipse 
    stroke(tempR+45, tempG+45, tempB+45);
    fill(tempR+45, tempG+45, tempB+45);
    ellipse(xPos, yPos, dia/2, dia/2);
    ellipseMode(CORNER);
  }

  //cool method for creating blackholes
  void drawHole() {
    //makes ellipse come from center
    ellipseMode(CENTER);
    //sets strokeweight to 0 so no black lines
    strokeWeight(0);
    //ellipses that make up the star
    //(might wanna figure out if I can do a for loop for this)
    stroke(tempR, tempG, tempB);
    fill(tempR, tempG, tempB);
    ellipse(xPos, yPos, dia, dia);
    //2nd ellipse
    stroke(tempR-10, tempG-10, tempB-10);
    fill(tempR-10, tempG-10, tempB-10);
    ellipse(xPos, yPos, dia/1.2, dia/1.2);
    //3rd ellipse
    stroke(tempR-30, tempG-30, tempB-30);
    fill(tempR-45, tempG-45, tempB-45);
    ellipse(xPos, yPos, dia/1.5, dia/1.5);
    //4th ellipse
    stroke(tempR-100, tempG-100, tempB-100);
    fill(tempR-100, tempG-100, tempB-100);
    ellipse(xPos, yPos, dia/1.7, dia/1.7);
    //5th ellipse 
    stroke(tempR-200, tempG-200, tempB-200);
    fill(tempR-255, tempG-255, tempB-255);
    ellipse(xPos, yPos, dia/2, dia/2);
    ellipseMode(CORNER);
  }
}
