//Methods for each warp zone and system.

//jump menu 
void jumpMap(){
  
    //background
    background(#2D3234);

    sI = systemInfo[0];

    //jump menu 
    fill(200);
    rect(width/3, height/175, width/3, height/15);
    fill(255);
    textAlign(CENTER);
    textSize(width/40);
    text(sI, width/3, height/175, width/3, height/15);

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

}

void solSystem(){

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

    //Create Planets and Ships
    Homeworld.obj("Homeworld.png");
    Homeworld.objDraw();

    Dusteye.obj("Dustedeye.png");
    Dusteye.objDraw();

    //UI
    Player.playerUI();
    //ship
    Player.playerDraw();
    //move
    Player.playerMove();
    
    //Menus
    Homeworld.objInter(20, 30, 20, 10, "Your Home, It looks even more amazing from space. You contact your planet and they offer to trade with and replenish your resources. Your Homeworld's demand for ore is average, it will purchase 10 ore from you for 20 cash. However it greatly awaits the knowledge you'd bring it, it will purchase 5 data for 30 cash. Its spacedocks are small and expensive so the charge to repair 2 health is 20 cash. Its charging ports are effective so the cost to recharge 2 energy is only 10 cash.");
    
    Dusteye.objUse(2, random(5,15), 2, .25, "Dusteye, its famous craters personify the orange planet. It's ore while not the most accsesable, is reliably retrivable. At the expense of 2 energy you could get an average ammount. However the dead planet has been studied for eons, wasting 2 energy to do further research will bring minimal data.");
}
