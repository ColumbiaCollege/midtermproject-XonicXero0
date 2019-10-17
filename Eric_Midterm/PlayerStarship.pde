class Starship {

  //variables 
  //variables for position
  float X;
  float Y;
  //variable for player speed
  float a;
  float Speed;
  //variables for UI(Health, Energy, and Resources)
  float Health;
  float Energy;
  float Cash;
  float Ore;
  float Data;
  //player model
  PImage Playership; 
  int ShipSize;
  //booleans for ship movement
  boolean thrust = false;
  boolean boost  = false;


  //Constructor 
  Starship() {
    Playership = loadImage("Playership1L.png"); 
    ShipSize = width/50;
  }

  //methods 

  void playerMove() {

    //movement

    //player speed when thrusting and energy cost
    if (thrust) {
      Player.Speed = width/1000; 
      Player.Energy = Player.Energy - 0.001;
    }

    //player speed when boosting and energy cost
    if (boost) {
      Player.Speed = width/500;
      Player.Energy = Player.Energy - 0.005;
    }

    //code that makes the ship move to the mouse position when thrusters are activated
    if (thrust) {
      Player.X += Player.Speed*cos(a);
      Player.Y += Player.Speed*sin(a);
    }

    //code that makes it so thrust does not appear when destination isnt reached 
    if (dist(X, Y, mouseX, mouseY) <= ShipSize/4 ) {
      thrust = false;
    }

    //code that makes it so player cannot go behind/under status bar
    if (Player.Y < height/13) {
      Player.Y = height/13;
    }
  }

  void playerUI() {
    //Player Starship Info! (Currancy, Health, Energy, ETC.

    //health/energy bar progress

    //status/health/controls/etc bar
    stroke(#4B4A4A);
    strokeWeight(2);
    fill(#818181);
    rect(0, 0, width, height/13); 

    //SYSTEM INFO
    fill(200);
    rect(width/3, height/175, width/3, height/15);

    //SYSTEM NAME
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(width/50);
    //sI
    text(sI, width/3, height/175, width/3, height/15);
    textAlign(BASELINE);

    //health bar
    stroke(#4B4A4A);
    strokeWeight(4);
    fill(#818181);
    rect(width/1.34, height/175, width/4, height/35);
    strokeWeight(0);
    stroke(0);
    fill(255, 0, 0);
    rect(width/1.34, height/175, Player.Health/100*width/4, height/35);

    //energy bar
    stroke(#4B4A4A);
    strokeWeight(4);
    fill(#818181);
    rect(width/1.34, height/25, width/4, height/35);
    strokeWeight(0);
    stroke(0);
    fill(0, 100, 255);
    rect(width/1.34, height/25, Player.Energy/100*width/4, height/35);

    //resource bars 
    stroke(#4B4A4A);
    strokeWeight(2);
    fill(#767675);
    rect(width/175, height/175, width/4, height/15);

    //Player Cash display
    textSize(width/100);
    fill(0);
    text("Cash", width/50, height/45); 
    text(Player.Cash, width/15, height/45);

    //Player Ore display
    textSize(width/100);
    fill(0);
    text("Ore", width/50, height/22);
    text(Player.Ore, width/15, height/22);

    //player Data sisplay
    textSize(width/100);
    fill(0);
    text("Data", width/50, height/15);
    text(Player.Data, width/15, height/15);

    strokeWeight(0);
    stroke(0);

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
  }

  void playerDraw() {

    pushMatrix();
    //makes ship face the mouse at all times (gotten mainly from API)
    translate(Player.X, Player.Y);
    a = atan2(mouseY-Player.Y, mouseX-Player.X);
    rotate(a);

    //thrust if ship is moving 
    if (thrust) {
      fill(#FF9864);
      stroke(#FF9864);
      triangle(-18, -7, -18, 7, -32, 0);
      fill(#F08C22);
      stroke(#F08C22);
      triangle(-18, -5, -18, 5, -23, 0);
    }

    //super thrust is the ship is boosting 
    if (thrust && boost) {
      fill(#CEFBFF);
      stroke(#CEFBFF);
      triangle(-18, -7, -18, 7, -38, 0);
      stroke(#83F4FF);
      fill(#83F4FF);
      triangle(-18, -5, -18, 5, -25, 0);
    }

    imageMode(CENTER);
    Playership.resize(ShipSize, ShipSize);
    image(Playership, 0, 0);

    imageMode(CORNER);

    popMatrix();
  }

  //player takes damage when hitting Asteroid
  //credit to drake for help
  void ContactAsteroid(ArrayList<StarDebris> asteroids) {
    for (int i = 0; i < asteroids.size(); i++ ) {
      if (dist(X, Y, asteroids.get(i).xPos, asteroids.get(i).yPos) <= asteroids.get(i).dia/2+ShipSize/3) {
        Health -= 10;
        asteroids.remove(i);
      }
    }
  }
}
