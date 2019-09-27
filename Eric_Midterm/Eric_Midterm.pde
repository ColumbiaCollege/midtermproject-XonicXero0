//Eric Price's Midterm Project!
//SOLAR SAILING (game name?)

//Declar Player's Starship
Starship Player;

void setup() {
  size(1200, 800);
  background(0);
  Player = new Starship();
}

void draw() {
  background(#030303);

  Player.Playerdraw();

  Player.move();
}

void keyPressed() {
  //moves left
  if (key == 'a') {
    Player.left = true;
  }
  //moves right 
  if (key == 'd') {
    Player.right = true;
  } 
  //moves up
  if (key == 'w') {
    Player.forward = true;
  } 
  //moves down
  if (key == 's') {
    Player.backward = true;
  }
}

void keyReleased() {
  //stops right
  if (key == 'a') {
    Player.left = false;
  }
  //stops right 
  if (key == 'd') {
    Player.right = false;
  } 
  //stops forward
  if (key == 'w') {
    Player.forward = false;
  } 
  //stops backward
  if (key == 's') {
    Player.backward = false;
  }
}
