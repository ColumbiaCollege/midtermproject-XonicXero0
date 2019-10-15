class Star {

  //properties
  float tempX;
  float tempY;
  float dia;
  float tempR;
  float tempG;
  float tempB;

  //constructor 
  Star( float X, float Y, float D, float R, float G, float B) {
    tempX = X;
    tempY = Y;
    dia = D;
    tempR = R;
    tempG = G;
    tempB = B;
  }

  //methods for normal stars

  //allows for selection of stars in the warp menu
  void warpStar(int s) {
    float disX = tempX - mouseX;
    float disY = tempY - mouseY;
    if (mousePressed && sqrt(sq(disX) + sq(disY)) < dia/2 ) {
      systems = s;
    }
  }

  //player takes damage when too close to star 
  void contactStar() {
    float disX = tempX - Player.X;
    float disY = tempY - Player.Y;
    if (sqrt(sq(disX) + sq(disY)) < dia/2 ) {
      Player.Health = Player.Health - .1;
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
    ellipse(tempX, tempY, dia, dia);
    //2nd ellipse
    stroke(tempR+10, tempG+10, tempB+10);
    fill(tempR+10, tempG+10, tempB+10);
    ellipse(tempX, tempY, dia/1.2, dia/1.2);
    //3rd ellipse
    stroke(tempR+20, tempG+20, tempB+20);
    fill(tempR+20, tempG+20, tempB+20);
    ellipse(tempX, tempY, dia/1.5, dia/1.5);
    //4th ellipse
    stroke(tempR+35, tempG+35, tempB+35);
    fill(tempR+35, tempG+35, tempB+35);
    ellipse(tempX, tempY, dia/1.7, dia/1.7);
    //5th ellipse 
    stroke(tempR+45, tempG+45, tempB+45);
    fill(tempR+45, tempG+45, tempB+45);
    ellipse(tempX, tempY, dia/2, dia/2);
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
    ellipse(tempX, tempY, dia, dia);
    //2nd ellipse
    stroke(tempR-10, tempG-10, tempB-10);
    fill(tempR-10, tempG-10, tempB-10);
    ellipse(tempX, tempY, dia/1.2, dia/1.2);
    //3rd ellipse
    stroke(tempR-30, tempG-30, tempB-30);
    fill(tempR-45, tempG-45, tempB-45);
    ellipse(tempX, tempY, dia/1.5, dia/1.5);
    //4th ellipse
    stroke(tempR-100, tempG-100, tempB-100);
    fill(tempR-100, tempG-100, tempB-100);
    ellipse(tempX, tempY, dia/1.7, dia/1.7);
    //5th ellipse 
    stroke(tempR-200, tempG-200, tempB-200);
    fill(tempR-255, tempG-255, tempB-255);
    ellipse(tempX, tempY, dia/2, dia/2);
    ellipseMode(CORNER);
  }
}
