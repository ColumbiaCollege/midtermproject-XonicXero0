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
