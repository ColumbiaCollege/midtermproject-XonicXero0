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
  Dusteye.objUsed = true;
  RGasgiant.objUsed = true;
  RRuinedplanet.objUsed = true;
  Greengas.objUsed = true;
  Lavaland.objUsed = true;
  Dune.objUsed = true;
  Frosty.objUsed = true;
  Havock.objUsed = true;
}
