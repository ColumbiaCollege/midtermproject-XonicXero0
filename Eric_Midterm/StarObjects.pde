class Starobj {

  //variables
  PImage placeHolder;
  float objX;
  float objY;
  int objW;
  int objH;
  boolean objUsed = false;
  boolean objTrade = false;
  boolean objMD = false;

  //constructor 
  Starobj( float _X, float _Y, int _W, int _H) {
    objX = _X;
    objY = _Y;
    objW = _W;
    objH = _H;
  }

  //methods

  //method for determining the image used for an object 
  void obj(String _im) {
    placeHolder = loadImage(_im);
  }

  //determines position and size of an object
  void objDraw() {
    placeHolder.resize(objW, objH);
    image(placeHolder, objX, objY);
  }

  //allows for an object (like a spaceship) to move
  void objMove(float xS, float yS) {
    objX = objX + xS;
    objY = objY + yS;

    //makes ships reappear if offscreen

    if (objY < -400) {
      objY = height + 400;
    }
    if (objY > height + 400) {
      objY = -400;
    }
    if (objX < -400) {
      objX = width + 400;
    }
    if (objX > width + 400) {
      objX = -400;
    }
  }

  //code that allows you to trade with planets 
  void objInter(float _O, float _D, float _H, float _E, String lore) {
    if (mousePressed && playerX >= objX && playerX <= (objX + objW) && playerY >= objY && playerY <= (objY + objH)) {
      objTrade = true;
      objUsed = false;
    }
    if (objTrade) {
      //text bar for planet info
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#818181);
      rect(width/6, height/4, width/1.5, height/3);
      textSize(width/100);
      textAlign(LEFT);
      fill(0);
      text(lore, width/6, height/4, width/1.5, height/3); 
      textAlign(CENTER);

      //visuals for trade buttons 

      //button1
      textAlign(CENTER, CENTER);
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/6, height/1.71, width/6, height/12);
      textSize(width/50);
      fill(0);
      text("Sell Ore", width/6, height/1.71, width/6, height/12);
      //button2
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/3, height/1.71, width/6, height/12);
      textSize(width/50);
      fill(0);
      text("Sell Data", width/3, height/1.71, width/6, height/12);
      //button3
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/2, height/1.71, width/6, height/12);
      textSize(width/50);
      fill(0);
      text("Buy Health", width/2, height/1.71, width/6, height/12);
      //button4
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/1.5, height/1.71, width/6, height/12);
      textSize(width/50);
      fill(0);
      text("Buy Energy", width/1.5, height/1.71, width/6, height/12);
      textAlign(CENTER);
    }

    //actual buttons 
    //button 1(sell ore)
    if (objTrade && objUsed && playerOre > 10 && mouseX >= width/6 && mouseX <= (width/6 + width/6) && mouseY >= height/1.71 && mouseY <= (height/1.71 + height/12)) {
      playerOre = playerOre - 10;
      playerCash = playerCash + _O;
      //resets objUsed to false
      objUsed = false;
    }
    //button 2(sell data)
    if (objTrade && objUsed && playerData > 5 && mouseX >= width/3 && mouseX <= (width/3 + width/6) && mouseY >= height/1.71 && mouseY <= (height/1.71 + height/12)) {
      playerData = playerData - 5;
      playerCash = playerCash + _D;
      //resets objUsed to false
      objUsed = false;
    }
    //button 3(buy health)
    if (objTrade && objUsed && playerCash > 2 && playerHealth < 100 && mouseX >= width/2 && mouseX <= (width/2 + width/6) && mouseY >= height/1.71 && mouseY <= (height/1.71 + height/12)) {
      playerHealth = playerHealth + 2;
      playerCash = playerCash - _H;
      //resets objUsed to false
      objUsed = false;
    }
    //button 4(buy energy)
    if (objTrade && objUsed && playerCash > 2 && playerEnergy < 100 && mouseX >= width/1.5 && mouseX <= (width/1.5 + width/6) && mouseY >= height/1.71 && mouseY <= (height/1.71 + height/12)) {
      playerEnergy = playerEnergy + 2;
      playerCash = playerCash - _E;
      //resets objUsed to false
      objUsed = false;
    }

    if (keyPressed) {
      objTrade = false;
    }
  }

  //code that allows for energy to be exchanged for resources on planets 
  void objUse(float _E1, float _O, float _E2, float _D, String lore) {
    if (mousePressed && playerX >= objX && playerX <= (objX + objW) && playerY >= objY && playerY <= (objY + objH)) {
      objMD = true;
      objUsed = false;
    }
    if (objMD) {
      //text bar for planet info
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#818181);
      rect(width/6, height/4, width/1.5, height/3);
      textSize(width/100);
      textAlign(LEFT);
      fill(0);
      text(lore, width/6, height/4, width/1.5, height/3);
      textAlign(CENTER);

      //visuals for mine/data buttons 

      //button1
      textAlign(CENTER, CENTER);
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/6, height/1.71, width/3, height/12);
      textSize(width/50);
      fill(0);
      text("Mine", width/6, height/1.71, width/3, height/12);
      //button2
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/2, height/1.71, width/3, height/12);
      textSize(width/50);
      fill(0);
      text("Research", width/2, height/1.71, width/3, height/12);
      textAlign(CENTER);
    }

    //actual buttons 
    //button 1(mine ore)
    if (objMD && objUsed && playerEnergy > 2 && mouseX >= width/6 && mouseX <= (width/6 + width/3) && mouseY >= height/1.71 && mouseY <= (height/1.71 + height/12)) {
      playerEnergy = playerEnergy - _E1;
      playerOre = playerOre + _O;
      //resets objUsed to false
      objUsed = false;
    }
    //button 2(get data)
    if (objMD && objUsed && playerEnergy > 2 && mouseX >= width/2 && mouseX <= (width/2 + width/3) && mouseY >= height/1.71 && mouseY <= (height/1.71 + height/12)) {
      playerEnergy = playerEnergy - _E2;
      playerData = playerData + _D;
      //resets objUsed to false
      objUsed = false;
    }

    if (keyPressed) {
      objMD = false;
    }
  }
}
