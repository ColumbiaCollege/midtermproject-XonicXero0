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
//system info
String[]systemInfo = new String[5];{
systemInfo[0] = "Home System";
systemInfo[1] = "Bazelgeuse System";
systemInfo[2] = "Drake System";
systemInfo[3] = "CLand System";
systemInfo[4] = "TwinE System";
}
String sI; 

//declare other shit
Star sun, bazelgeuse, whiteS, cStar, eleonora, evelyn;

Starobj Homeworld, RGasgiant, RRuinedplanet, Drake, Cargoship, Lavaland, Dusteye, Greengas, Cworld, Dune, Luxship;

//global variables for player

//systems!
int systems = 1;

//possible systems that can appear on UI(not working)
String jump = "Space Manipulation Jump";

void setup() {
  size(1920, 1080);
  //fullScreen();
  background(0);

  //player starting position in system 
  playerX = width/2;
  playerY = height/2;

  //starting HP/Energy
  playerHealth = 100;
  playerEnergy = 100;

  //type what this is called when you remember 
  Player = new Starship();

  sun = new Star(width/3, height/1.5, width/10, 236, 255, 50);
  bazelgeuse = new Star(width/4, height/3, width/8, 255, 161, 126);
  whiteS = new Star(width/1.2, height/6, width/20, 207, 246, 203);
  cStar = new Star(width/1.4, height/1.1, width/9, 245, 218, 84);
  eleonora = new Star(width/1.8, height/2.5, width/8.5, 222, 88, 58);
  evelyn = new Star (width/3, height/1.4, width/23, 243, 247, 217);

  //load custom objs, ships
  Homeworld = new Starobj(width/2, height/3, width/21, width/21);
  RGasgiant = new Starobj(width/1.5, height/4, width/15, width/15);
  RRuinedplanet = new Starobj(width/3, height/1.2, width/24, width/24);
  Drake = new Starobj(width/2, height/1.7, width/17, width/17);
  Cargoship = new Starobj(width/5, height/1.5, width/30, height/8);
  Cworld = new Starobj(width/2, height/1.8, width/24, width/24);
  Lavaland = new Starobj(width/1.5, height/5, width/27, width/27);
  Dusteye = new Starobj(width/1.6, height/1.5, width/25, width/25);
  Greengas = new Starobj(width/5, height/2, width/13, width/13);
  Dune = new Starobj(width/1.2, height/7, width/24, width/24);
  Luxship = new Starobj(width/1.2, height/1.2, width/10, height/13);
}

void draw() {

  //making sure playerhealth is not above max ammount
  if (playerHealth > 100) {
    playerHealth = 100;
  }

  //making sure playerenergy is not above max ammount
  if (playerEnergy > 100) {
    playerEnergy = 100;
  }

  switch(systems) {

    //warp area
  case 0:

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

    sun.warpStar(1);

    bazelgeuse.drawStar();

    bazelgeuse.warpStar(2);

    whiteS.drawStar();

    whiteS.warpStar(3);

    cStar.drawStar();

    cStar.warpStar(4);

    eleonora.drawStar();

    eleonora.warpStar(5);

    break;

    //system 1
  case 1:

    //resets background
    background(#030303);

    //background stars
    for (int t = 0; t < width; t=t+50) {
      float r = random (height);

      strokeWeight(0);
      stroke(0);
      fill(255);
      rect(0+t, 0+r, 2, 2);
    }
    
    sI = systemInfo[0];

    //methods for star
    sun.drawStar();

    //Starobj methods
    Homeworld.obj("Homeworld.png");

    Homeworld.objDraw();

    Dusteye.obj("Dustedeye.png");

    Dusteye.objDraw();

    //UI
    Player.playerUI();

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;

    //system 2
  case 2:

    //resets background
    background(#150D0D);

    //background stars
    for (int t = 0; t < width; t=t+80) {
      float r = random (height);


      strokeWeight(0);
      stroke(0);
      fill(255);
      rect(0+t, 0+r, 2, 2);
    }
    
    sI = systemInfo[1];

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

    //background stars
    for (int t = 0; t < width; t=t+50) {
      float r = random (height);

      strokeWeight(0);
      stroke(0);
      fill(255);
      rect(0+t, 0+r, 2, 2);
    }
    
     sI = systemInfo[2];

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

    //system4
  case 4:

    //resets background
    background(#030303);

    //background stars
    for (int t = 0; t < width; t=t+50) {
      float r = random (height);

      strokeWeight(0);
      stroke(0);
      fill(255);
      rect(0+t, 0+r, 2, 2);
    }
    
     sI = systemInfo[3];

    cStar.drawStar();

    //Starobj methods
    Cworld.obj("Cworld.png");

    Cworld.objDraw();

    Greengas.obj("Greengas.png");

    Greengas.objDraw();

    Lavaland.obj("Lavaland.png");

    Lavaland.objDraw();

    //UI
    Player.playerUI();

    //ship
    Player.playerDraw();

    //move
    Player.playerMove();

    break;

    //system5
  case 5:

    //resets background
    background(#030303);

    //background stars
    for (int t = 0; t < width; t=t+50) {
      float r = random (height);

      strokeWeight(0);
      stroke(0);
      fill(255);
      rect(0+t, 0+r, 2, 2);
    }
    
     sI = systemInfo[4];

    eleonora.drawStar();

    evelyn.drawStar();

    //Starobj methods

    Dune.obj("Dune.png");

    Dune.objDraw();

    Luxship.obj("Luxship.png");

    Luxship.objDraw();

    Luxship.objMove(-width/1200, 0);

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
    playerX = width/2;
    playerY = height/2;
    playerEnergy = playerEnergy - 10;
    systems = 0;
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
