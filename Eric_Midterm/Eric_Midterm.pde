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
float playerCash;
float playerAmmo;
float playerOre;
float playerData;
float playerKills;
float playerRewards;

//system info
String[]systemInfo = new String[7];
{
  systemInfo[0] = "Space Manipulation Jump";
  systemInfo[1] = "Home System";
  systemInfo[2] = "Bazelgeuse System";
  systemInfo[3] = "Drake System";
  systemInfo[4] = "Archway System";
  systemInfo[5] = "Eleeve System";
  systemInfo[6] = "Gregory System";
}
//tells UI which ssytem its in
String sI; 

//declare other shit
Star sun, bazelgeuse, whiteS, cStar, eleonora, evelyn, greg;

Starobj Homeworld, RGasgiant, RRuinedplanet, Drake, Cargoship, Lavaland, Dusteye, Greengas, Cworld, Dune, Luxship, Frosty, Metro, Havock;

//global variables for player

//systems!
int systems = 1;

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
  bazelgeuse = new Star(width/4, height/3, width/8, 232, 117, 75);
  whiteS = new Star(width/1.2, height/6, width/20, 207, 246, 203);
  cStar = new Star(width/1.4, height/1.1, width/9, 245, 218, 84);
  eleonora = new Star(width/1.8, height/2.5, width/8.5, 255, 161, 126);
  evelyn = new Star(width/3, height/1.4, width/23, 82, 173, 232);
  greg = new Star(width/1.1, height/3, width/11, 226, 232, 82); 

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
  Frosty = new Starobj(width/8, height/1.4, width/25, width/25);
  Metro = new Starobj(width/3, height/2, width/22, width/22);
  Havock = new Starobj(width/1.6, height/3, width/20, width/20);
  
  
}

void draw() {

  //testing 
  println(playerHealth);
  println(playerEnergy);
  println(playerOre);
  println(playerData);

  //making sure playerhealth is not above max ammount
  if (playerHealth > 100) {
    playerHealth = 100;
  }
  //making sure playerenergy is not above max ammount
  if (playerEnergy > 100) {
    playerEnergy = 100;
  }
  //gameover state
  if (playerHealth < 0) {
    //game over
  }
  //energy over state
  if (playerEnergy < 0) {
    playerHealth = playerHealth - 0.5;
  }

  switch(systems) {

    //warp area
  case 0:

    //background
    background(#2D3234);

    sI = systemInfo[0];
    
    //jump menu 
    fill(200);
    rect(width/3, height/175, width/3, height/15);
    fill(255);
    textAlign(CENTER);
    textSize(width/50);
    text(sI, width/2, height/17);

    //selectable stars

    sun.drawStar();

    bazelgeuse.drawStar();

    whiteS.drawStar();

    cStar.drawStar();

    eleonora.drawStar();

    greg.drawStar();

    //where stars take you if they are clicked 
    sun.warpStar(1);
    bazelgeuse.warpStar(2);
    whiteS.warpStar(3);
    cStar.warpStar(4);
    eleonora.warpStar(5);
    greg.warpStar(6);

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

    sI = systemInfo[1];

    //methods for star
    sun.drawStar();
    sun.contactStar();

    //Starobj methods
    Homeworld.obj("Homeworld.png");

    Homeworld.objDraw();

    Dusteye.obj("Dustedeye.png");

    Dusteye.objDraw();

    playerOre = Dusteye.objUse(playerOre, 3, random(5, 15));

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

    sI = systemInfo[2];

    bazelgeuse.drawStar();
    bazelgeuse.contactStar();

    //Staronj methods 
    RGasgiant.obj("RGasgiant.png");

    RGasgiant.objDraw();

    playerData = RGasgiant.objUse(playerData, 20, random(5, 15));

    RRuinedplanet.obj("RRuinedplanet.png");

    RRuinedplanet.objDraw();

    playerOre = RRuinedplanet.objUse(playerOre, 7, random(10, 35));

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

    sI = systemInfo[3];

    whiteS.drawStar();
    whiteS.contactStar();

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

    sI = systemInfo[4];

    cStar.drawStar();
    cStar.contactStar();

    //Starobj methods
    Cworld.obj("Cworld.png");

    Cworld.objDraw();

    Greengas.obj("Greengas.png");

    Greengas.objDraw();

    playerData = Greengas.objUse(playerData, 15, random(3, 13));

    Lavaland.obj("Lavaland.png");

    Lavaland.objDraw();

    playerData = Lavaland.objUse(playerData, 5, random(2, 10));

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

    sI = systemInfo[5];

    eleonora.drawStar();
    eleonora.contactStar();

    evelyn.drawStar();
    evelyn.contactStar();

    //Starobj methods

    Dune.obj("Dune.png");

    Dune.objDraw();

    playerOre = Dune.objUse(playerOre, 4, random(5, 15));

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

  case 6:

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

    sI = systemInfo[6];

    //methods for star
    greg.drawStar();
    greg.contactStar();
    
    //Starobj methods
    
    Frosty.obj("Frosty.png");
    
    Frosty.objDraw();
    
    playerOre = Frosty.objUse(playerOre, 5, random(7, 25));
    
    Metro.obj("Metro.png");
    
    Metro.objDraw();
    
    Havock.obj("Havock.png");
    
    Havock.objDraw();
    
    playerData = Havock.objUse(playerData, 20, random(1, 25));

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
  //warp button 
  if (key == '1') {
    playerX = width/2;
    playerY = height/2;
    playerEnergy = playerEnergy - 10;
    systems = 0;
  }  
  if (key == 'q') {
    Dusteye.objUsed = true;
    RGasgiant.objUsed = true;
    RRuinedplanet.objUsed = true;
    Greengas.objUsed = true;
    Lavaland.objUsed = true;
    Dune.objUsed = true;
    Frosty.objUsed = true;
    Havock.objUsed = true;
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
