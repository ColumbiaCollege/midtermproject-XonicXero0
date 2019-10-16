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
  Homeworld.objInteract = true;
  RGasgiant.objInteract = true;
  RRuinedplanet.objInteract = true;
  Drake.objInteract = true;
  Cargoship.objInteract = true;
  Lavaland.objInteract = true;
  Dusteye.objInteract = true;
  Greengas.objInteract = true;
  Cworld.objInteract = true;
  Dune.objInteract = true;
  Luxship.objInteract = true;
  Frosty.objInteract = true;
  Metro.objInteract = true;
  Havock.objInteract = true;
}
