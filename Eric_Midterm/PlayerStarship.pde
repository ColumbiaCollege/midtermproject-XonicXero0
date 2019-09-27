class Starship {

  //properties 

  //variables for position
  float xPos =0;
  float yPos =0;
  //UDLR booleans
  boolean forward = false;
  boolean backward = false;
  boolean left = false;
  boolean right = false;

  //Constructor 
  Starship() {
    //initial position
    xPos = 0;
    yPos = 0;
  }

  //methods 

  void move() {

    //movement

    if (forward) {
      yPos = yPos -1;
    }

    if (backward) {
      yPos = yPos +1;
    }

    if (left) {
      xPos = xPos -1;
    }

    if (right) {
      xPos = xPos +1;
    }

    //code that makes ball stay on screen

    //makes ball reappear on right side if it moves too far to the left
    if (xPos == -10) {
      xPos = 1209;
    }

    //makes ball reappear on left side if it moves too far to the right
    if (xPos == 1210) {
      xPos = -9;
    }

    //makes ball reappear on bottom if it moves too far up
    if (yPos == -10) {
      yPos = 809;
    }

    //makes ball reappear on tope if it moves too far down
    if (yPos == 810) {
      yPos = -9;
    }
  }

  void Playerdraw() {

    //shape properties
    ellipseMode(CENTER);
    noStroke();

    //makes ship face the mouse at all times (gotten mainly from API)
    translate(width/2, height/2);
    float a = atan2(mouseY-height/2, mouseX-width/2);
    rotate(a);

    //ship body
    fill(#C8C9CE);
    triangle(xPos-9, yPos+10, xPos, yPos-20, xPos+9, yPos+10);
    ellipse(xPos, yPos, 20, 11);

    //cockpit
    fill(#95F4FF);
    ellipse(xPos, yPos, 10, 15);

    println(xPos);
  }
}
