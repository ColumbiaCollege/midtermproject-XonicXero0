//Eric Price's Midterm Project!
//SOLAR SAILING (game name?)

//Declar Player's Starship
Starship Player;

void setup() {
  size(1200,800);
  //fullScreen();
  background(0);
  Player = new Starship();
}

void draw() {
  background(#030303);

  Player.Playerdraw();

  Player.move();
}

void keyPressed() {
  //moves
  if (key == 'w') {
    Player.move = true;
  }

}

void keyReleased() {
  //stops 
  if (key == 'w') {
    Player.move = false;
  }
  
}
