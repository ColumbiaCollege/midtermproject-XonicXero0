//Eric Price's Midterm Project!
//SOLAR SAILING (game name?)

//Declar Player's Starship
Starship Player;

void setup() {
  //size(1920, 1080);
  fullScreen();
  background(0);
  Player = new Starship();
}

void draw() {
  //resets background
  background(#030303);
 
  pushMatrix();
  
  //ship
  Player.playerDraw();

  //move
  Player.playerMove();
  
  popMatrix();

  //status/health/controls/etc bar
  stroke(#4B4A4A);
  strokeWeight(2);
  fill(#818181);
  rect(0, 0, width, height/13); 
  
  //health bar
  fill(255,0,0);
  rect(width/3,height/175,width/3,height/15);
  
  //health sign
  fill(255);
  textAlign(CENTER);
  textSize(width/50);
  text("Starship Integrity", width/2,height/17);
  
  
  //resets stroke values
  strokeWeight(0);
  stroke(0);
}

void keyPressed() {
  //moves
  if (key == 'w') {
    Player.thrust = true;
  }
}

void keyReleased() {
  //stops 
  if (key == 'w') {
    Player.thrust = false;
  }
}
