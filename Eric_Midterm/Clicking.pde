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
  if (key == '1' && Player.Energy > 10) {
    Player.X = width/2;
    Player.Y = height/2;
    Player.Energy = Player.Energy - 10;
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

//clicking on planets when player is on them 
void mouseClicked() {
  Homeworld.objUsed = true;
  RGasgiant.objUsed = true;
  RRuinedplanet.objUsed = true;
  Drake.objUsed = true;
  Cargoship.objUsed = true;
  Lavaland.objUsed = true;
  Dusteye.objUsed = true;
  Greengas.objUsed = true;
  Cworld.objUsed = true;
  Dune.objUsed = true;
  Luxship.objUsed = true;
  Frosty.objUsed = true;
  Metro.objUsed = true;
  Havock.objUsed = true;
}
