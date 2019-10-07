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

  //methods

  //fun method for making stars easy
  void drawStar() {
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
    ellipse(tempX, tempY, dia/1.2, dia/1.2);
    //3rd ellipse
    stroke(tempR-20, tempG-20, tempB-20);
    fill(tempR-20, tempG-20, tempB-20);
    ellipse(tempX, tempY, dia/1.5, dia/1.5);
    //4th ellipse
    stroke(tempR-35, tempG-35, tempB-35);
    fill(tempR-35, tempG-35, tempB-35);
    ellipse(tempX, tempY, dia/1.7, dia/1.7);
    //5th ellipse 
    stroke(tempR-45, tempG-45, tempB-45);
    fill(tempR-45, tempG-45, tempB-45);
    ellipse(tempX, tempY, dia/2, dia/2);
    ellipseMode(CORNER);
  }
}
