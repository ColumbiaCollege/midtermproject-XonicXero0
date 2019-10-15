//Eric Price's Midterm Project!
//SOLAR SAILING 

//Declare Player's Starship
Starship Player;

//system info
String[]systemInfo = new String[9];
{
  systemInfo[0] = "Space Manipulation Jump";
  systemInfo[1] = "Sol System";
  systemInfo[2] = "Bazelgeuse System";
  systemInfo[3] = "Drake System";
  systemInfo[4] = "Archway System";
  systemInfo[5] = "Eleeve System";
  systemInfo[6] = "Gregory System";
  systemInfo[7] = "Eye System";
  systemInfo[8] = "Decay System";
}
//tells UI which ssytem its in
String sI; 

//Arraylist for Asteroids
ArrayList<StarDebris> Asteroids = new ArrayList<StarDebris>(); 

//declare other shit
Star sun, bazelgeuse, whiteS, cStar, eleonora, evelyn, greg, iris, decay, blackHole1;

Starobj Homeworld, RGasgiant, RRuinedplanet, Drake, Cargoship, Lavaland, Dusteye, Greengas, Cworld, Dune, Luxship, Frosty, Metro, Havock;

//global variables for player

//systems!
int systems = 1;

void setup() {
  size(1920, 1080);
  //fullScreen();
  background(0);
  frameRate(60);

  //call Player 
  Player = new Starship();

  //call Stars
  sun = new Star(width/3, height/1.5, width/10, 236, 255, 50);
  bazelgeuse = new Star(width/4, height/3, width/8, 232, 117, 75);
  whiteS = new Star(width/1.2, height/6, width/20, 207, 246, 203);
  cStar = new Star(width/1.4, height/1.3, width/9, 245, 218, 84);
  eleonora = new Star(width/1.8, height/2.5, width/8.5, 255, 161, 126);
  evelyn = new Star(width/3, height/1.4, width/23, 82, 173, 232);
  greg = new Star(width/1.1, height/3, width/11, 226, 232, 82); 
  iris = new Star(width/2, height/1.2, width/19, 208, 237, 245);
  decay = new Star(width/5, height/6.3, width/16, 232, 210, 136);
  blackHole1 = new Star(width/1.8, height/1.3, width/13, 242, 239, 237);

  //call starObj (planets, shit, etc)
  //inhabited 
  Homeworld = new Starobj(width/2, height/3, width/21, width/21);
  Drake = new Starobj(width/2, height/1.7, width/17, width/17);
  Cworld = new Starobj(width/2, height/1.8, width/24, width/24);
  Metro = new Starobj(width/3, height/2, width/22, width/22);
  //spaceships
  Luxship = new Starobj(width/1.2, height/1.6, width/10, height/13);
  Cargoship = new Starobj(width/5, height/1.5, width/30, height/8);
  ////minable(Ore) researchable(data)
  RGasgiant = new Starobj(width/1.5, height/4, width/13, width/13);
  Greengas = new Starobj(width/5, height/2, width/13, width/13);
  Havock = new Starobj(width/1.6, height/3, width/20, width/20);
  Lavaland = new Starobj(width/1.5, height/5, width/27, width/27);
  Dusteye = new Starobj(width/1.6, height/1.5, width/25, width/25);
  Dune = new Starobj(width/1.2, height/7, width/24, width/24);
  Frosty = new Starobj(width/8, height/1.4, width/25, width/25);
  RRuinedplanet = new Starobj(width/3, height/1.2, width/24, width/24);

  //player starting position in system 
  Player.X = width/2;
  Player.Y = height/2;

  //starting HP/Energy
  Player.Health = 100;
  Player.Energy = 100;
}

void draw() {

  println(frameRate);
  
  //making sure Player.Health is not above max ammount
  if (Player.Health > 100) {
    Player.Health = 100;
  }
  //making sure Player.Energy is not above max ammount
  if (Player.Energy > 100) {
    Player.Energy = 100;
  }
  //gameover state
  if (Player.Health <= 0) {
    Player.Health = 0;
    systems = 10;
  }
  //energy over state
  if (Player.Energy <= 0) {
    Player.Energy = 0;
    Player.Health = Player.Health - 0.1;
  }

  switch(systems) {

    //warp area
  case 0:

    jumpMap();

    break;

    //Sol System
  case 1:

    solSystem();

    break;

    //Bazelgeuse System
  case 2:

    bazelgeuseSystem();

    break;

    //Drake System
  case 3:

    drakeSystem();

    break;

    //Archway system
  case 4:

    archwaySystem();

    break;

    //Eleeve System
  case 5:

    eleeveSystem();

    break;

    //Gregory System
  case 6:

    gregorySystem();

    break;

    //Eye System
  case 7:

    eyeSystem();

    break;

    //Decay System
  case 8:

    decaySystem();

    break;

    //future system
  case 9:

    break;

    //gameover
  case 10:

    gameOver();

    break;
  }
}
