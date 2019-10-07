//Eric Price's Midterm Project!
//SOLAR SAILING 

//Declare Player's Starship
Starship Player;

//properties 

//variables for position
float playerX;
float playerY;
//variable for player speed
float a;
float playerSpeed;
//variables for UI(Health, Energy, and Resources)(Not USED YET)
float playerHealth;
float playerEnergy;
//float playerCash;
//float playerAmmo;
//float playerOre;
//float playerKnowledge;

//declare other shit
Star sun, bazelgeuse, whiteS;

Starobj Homeworld, RGasgiant, RRuinedplanet, Drake, Cargoship;

//global variables for player

//systems!
int systems = 0;

//possible systems that can appear on UI(not working)
String jump = "Space Manipulation Jump";


void setup() {
  size(1920, 1080);
  //fullScreen();
  background(0);

  //player starting position in system 
  playerX = width/2;
  playerY = height/2;

  //type what this is called when you remember 
  Player = new Starship();

  sun = new Star(width/3, height/1.5, width/10, 236, 255, 50);
  bazelgeuse = new Star(width/4, height/3, width/8, 255, 161, 126);
  whiteS = new Star(width/1.2, height/6, width/20, 207, 246, 203);

  //load custom objs, ships
  Homeworld = new Starobj(width/2, height/3, width/25, width/25);
  RGasgiant = new Starobj(width/1.5, height/4, width/15, width/15);
  RRuinedplanet = new Starobj(width/3, height/1.2, width/24, width/24);
  Drake = new Starobj(width/2, height/1.7, width/17, width/17);
  Cargoship = new Starobj(width/5, height/1.5, width/30, height/8);
}

void draw() {

  switch(systems) {

    //system 1
  case 0:

    //resets background
    background(#030303);

    //methods for star
    sun.drawStar();

    //Starobj methods
    Homeworld.obj("Homeworld.png");

    Homeworld.objDraw();

    println(playerX);

    //UI
    Player.playerUI();

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;

    //warp selection areaw
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

    sun.drawStar();

    bazelgeuse.drawStar();

    whiteS.drawStar();

    break;

    //system 2
  case 2:

    //resets background
    background(#150D0D);

    bazelgeuse.drawStar();

    //Staronj methods 
    RGasgiant.obj("RGasgiant.png");

    RGasgiant.objDraw();

    RRuinedplanet.obj("RRuinedplanet.png");

    RRuinedplanet.objDraw();

    //UI
    Player.playerUI();

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;

    //system3
  case 3:

    //resets background
    background(#030303);

    whiteS.drawStar();

    //Starobj methods
    Drake.obj("Drake.png");

    Drake.objDraw();

    Cargoship.obj("Cargoship.png");

    Cargoship.objDraw();

    Cargoship.objMove(0, -width/1000);

    //UI
    Player.playerUI();

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
    systems ++;
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
