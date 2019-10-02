class Starship {

  //properties 

  //variables for position
  float xPos =0;
  float yPos =0;
  float easing = 0.01;
  boolean move = false;

    //Constructor 
    Starship() {
    //initial position
    xPos = width/2;
    yPos = height/2;
  }

  //methods 

  void move() {

    //movement

    //
    float targetX = mouseX;
    
    //
    float targetY = mouseY;
    
    if (move) {
     if(xPos > targetX){
       xPos-=2;
     }  if(xPos < targetX){
       xPos+=2;
     } 
     
     if(yPos > targetY){
       yPos-=2;
     }  if(yPos < targetY){
       yPos+=2;
     }
     
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
    translate(xPos, yPos);
    float a = atan2(mouseY-yPos, mouseX-xPos);
    rotate(a);
    fill(255);
    line(0, 0, 40, 0);

    //ship body
    fill(#C8C9CE);
    triangle(-10, -10, 30, 0, -10, 10);
    ellipse(0, 0, 11, 20);

    //cockpit
    fill(#95F4FF);
    ellipse(0, 0, 15, 10);

    //println();
  }
}
