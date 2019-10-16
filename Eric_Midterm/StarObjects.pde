class Starobj {

  //variables
  PImage placeHolder;
  float xPos;
  float yPos;
  int objW;
  int objH;
  boolean objInteract  = false;
  boolean objTrade = false;
  boolean objMD    = false;

  //constructor 
  Starobj( float _X, float _Y, int _W, int _H, String _im) {
    xPos        = _X;
    yPos        = _Y;
    objW        = _W;
    objH        = _H;
    placeHolder = loadImage(_im);
  }

  //methods

  //determines position and size of an object
  void objDraw() {
    placeHolder.resize(objW, objH);
    image(placeHolder, xPos, yPos);
  }

  //allows for an object (like a spaceship) to move
  void objMove(float xS, float yS) {
    xPos = xPos + xS;
    yPos = yPos + yS;

    //makes ships reappear if offscreen

    if (yPos < -400) {
      yPos = height + 400;
    }
    if (yPos > height + 400) {
      yPos = -400;
    }
    if (xPos < -400) {
      xPos = width + 400;
    }
    if (xPos > width + 400) {
      xPos = -400;
    }
  }

  //code that allows you to trade with planets 
  void objTradeWith(float _O, float _D, float _H, float _E, String obj, String lore) {
    if (mousePressed && Player.X >= xPos && Player.X <= (xPos + objW) && Player.Y >= yPos && Player.Y <= (yPos + objH)) {
      objTrade = true;
      objInteract = false;
    }
    if (objTrade) {
     //text bar for planet info
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#818181);
      rect(width/5, height/3, width/1.66, height/3);
      textSize(width/100);
      textAlign(LEFT, CENTER);
      fill(0);
      text(lore, width/4.9, height/3, width/1.69, height/3); 
      //text bar for planet name 
      textAlign(CENTER, CENTER);
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/6, height/3, width/30, height/3);
      rect(width/5+width/1.66,height/3, width/31, height/3);
      triangle(width/3, height/4, width/6, height/3, width/3, height/3);
      triangle(width/1.5, height/4, width/1.5, height/3, width/1.2, height/3);
      rect(width/3, height/4, width/3, height/12);
      textSize(width/30);
      fill(0);
      text(obj, width/3, height/4, width/3, height/12);
      textAlign(CENTER);

      //visuals for trade buttons 

      //button1
      textAlign(CENTER, CENTER);
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/6, height/1.5, width/6, height/12);
      textSize(width/50);
      fill(0);
      text("Sell Ore", width/6, height/1.5, width/6, height/12);
      //button2
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/3, height/1.5, width/6, height/12);
      textSize(width/50);
      fill(0);
      text("Sell Data", width/3, height/1.5, width/6, height/12);
      //button3
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/2, height/1.5, width/6, height/12);
      textSize(width/50);
      fill(0);
      text("Repair", width/2, height/1.5, width/6, height/12);
      //button4
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/1.5, height/1.5, width/6, height/12);
      textSize(width/50);
      fill(0);
      text("Recharge", width/1.5, height/1.5, width/6, height/12);
      textAlign(CENTER);
    }

    //actual buttons 
    //button 1(sell ore)
    if (objTrade && objInteract && Player.Ore > 10 && mouseX >= width/6 && mouseX <= (width/6 + width/6) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Ore = Player.Ore - 10;
      Player.Cash = Player.Cash + _O;
      //resets objInteract to false
      objInteract = false;
    }
    //button 2(sell data)
    if (objTrade && objInteract && Player.Data > 5 && mouseX >= width/3 && mouseX <= (width/3 + width/6) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Data = Player.Data - 5;
      Player.Cash = Player.Cash + _D;
      //resets objInteract to false
      objInteract = false;
    }
    //button 3(buy health)
    if (objTrade && objInteract && Player.Cash > _H && Player.Health < 100 && mouseX >= width/2 && mouseX <= (width/2 + width/6) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Health = Player.Health + 2;
      Player.Cash = Player.Cash - _H;
      //resets objInteract to false
      objInteract = false;
    }
    //button 4(buy energy)
    if (objTrade && objInteract && Player.Cash > _E && Player.Energy < 100 && mouseX >= width/1.5 && mouseX <= (width/1.5 + width/6) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Energy = Player.Energy + 2;
      Player.Cash = Player.Cash - _E;
      //resets objInteract to false
      objInteract = false;
    }

    if (keyPressed) {
      objTrade = false;
    }
  }

  //code that allows for energy to be exchanged for resources on planets 
  void objMineOrResearch(float _E1, float _O, float _E2, float _D, String obj, String lore) {
    if (mousePressed && Player.X >= xPos && Player.X <= (xPos + objW) && Player.Y >= yPos && Player.Y <= (yPos + objH)) {
      objMD = true;
      objInteract = false;
    }
    if (objMD) {
      //text bar for planet info
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#818181);
      rect(width/5, height/3, width/1.66, height/3);
      textSize(width/100);
      textAlign(LEFT, CENTER);
      fill(0);
      text(lore, width/4.9, height/3, width/1.69, height/3); 
      //text bar for planet name 
      textAlign(CENTER, CENTER);
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/6, height/3, width/30, height/3);
      rect(width/5+width/1.66,height/3, width/31, height/3);
      triangle(width/3, height/4, width/6, height/3, width/3, height/3);
      triangle(width/1.5, height/4, width/1.5, height/3, width/1.2, height/3);
      rect(width/3, height/4, width/3, height/12);
      textSize(width/30);
      fill(0);
      text(obj, width/3, height/4, width/3, height/12);
      textAlign(CENTER);

      //visuals for mine/data buttons 

      //button1
      textAlign(CENTER, CENTER);
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/6, height/1.5, width/3, height/12);
      textSize(width/50);
      fill(0);
      text("Mine", width/6, height/1.5, width/3, height/12);
      //button2
      stroke(#4B4A4A);
      strokeWeight(2);
      fill(#767675);
      rect(width/2, height/1.5, width/3, height/12);
      textSize(width/50);
      fill(0);
      text("Research", width/2, height/1.5, width/3, height/12);
      textAlign(CENTER);
    }

    //actual buttons 
    //button 1(mine ore)
    if (objMD && objInteract && Player.Energy > _E1 && mouseX >= width/6 && mouseX <= (width/6 + width/3) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Energy = Player.Energy - _E1;
      Player.Ore = Player.Ore + _O;
      //resets objInteract to false
      objInteract = false;
    }
    //button 2(get data)
    if (objMD && objInteract && Player.Energy > _E2 && mouseX >= width/2 && mouseX <= (width/2 + width/3) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Energy = Player.Energy - _E2;
      Player.Data = Player.Data + _D;
      //resets objInteract to false
      objInteract = false;
    }

    if (keyPressed) {
      objMD = false;
    }
  }
}
