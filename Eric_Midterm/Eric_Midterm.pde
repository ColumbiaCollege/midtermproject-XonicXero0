//Eric Price's Midterm Project!
//SOLAR SAILING 

//Declar Player's Starship
Starship Player;
//systems!
int systems = 0;

//possible systems that can appear on UI(not working)
String jump = "Space Manipulation Jump";
String SA = "System 0831";
String SB = "System 002";
String SC = "System 003";
String SD = "System 004";
String SE = "System 005";
String SF = "System 006";

//make class for ship later
PImage ship1;
//make class for planets later
PImage planet1;
//celestial bodies 
PImage gasGiant1;
//mineable bodies 
PImage planet2;

void setup() {
  size(1920,1080);
  //fullScreen();
  background(0);
  Player = new Starship();
  //load custom planets, ships
  ship1 = loadImage("Cargoship.png");
  planet1 = loadImage("Homeworld.png");
  gasGiant1 = loadImage("RGasgiant.png");
  planet2 = loadImage("RRuinedplanet.png");
}

void draw() {

  switch(systems) {

    //system 1
  case 0:

    //resets background
    background(#030303);

    //system 0831 star
    drawStar(236, 255, 50, width/3, height/1.5, width/10);

    image(planet1, width/2, height/3);
    planet1.resize(width/25, width/25);

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;

    //warp selection area
  case 1:

    //background
    background(#2D3234);

    //jump menu 
    fill(200);
    rect(width/3, height/175, width/3, height/15);

    //jump
    fill(255);
    textAlign(CENTER);
    textSize(width/50);
    text(jump, width/2, height/17);

    //selectable stars

    //system 0831 star
    drawStar(236, 255, 50, width/3, height/1.5, width/10);

    //system 6696 star
    drawStar(255, 161, 126, width/4, height/3, width/8);

    //system A364 star
    drawStar(207, 246, 203, width/1.2, height/6, width/20);

    break;

    //system 2
  case 2:

    //resets background
    background(#150D0D);

    //system 6696 star
    drawStar(255, 161, 126, width/4, height/3, width/8);

    image(gasGiant1, width/1.5, height/4);
    gasGiant1.resize(width/15, width/15);
    
    image(planet2, width/3, height/1.2);
    planet2.resize(width/24, width/24);

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();


    break;

    //system3
  case 3:

    //resets background
    background(#030303);

    //system A364 star
    drawStar(207, 246, 203, width/1.2, height/6, width/20);

    image(ship1, width/5, height/1.5);
    ship1.resize(width/30, height/8);

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;

    //system 4
  case 4:

    //resets background
    background(#030303);

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;

    //system 5
  case 5:

    //resets background
    background(#030303);

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;

    //system 6
  case 6:

    //resets background
    background(#030303);

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;
  }
}

//code for activating movement 
void keyPressed() {
  //moves
  if (key == 'w') {
    Player.thrust = true;
  }
  //boosts
  if (key == ' ') {
    Player.boost = true;
  }
  //test for switch
  if (key == '1') {
    systems = 2;
  }
}
//code for deactivating movement 
void keyReleased() {
  //stops 
  if (key == 'w') {
    Player.thrust = false;
  }
  //stops boost
  if (key == ' ') {
    Player.boost = false;
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
