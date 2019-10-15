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
  Starobj( float _X, float _Y, int _W, int _H, String _im) {
    objX = _X;
    objY = _Y;
    objW = _W;
    objH = _H;
    placeHolder = loadImage(_im);
  }

  //methods

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
  void objTradeWith(float _O, float _D, float _H, float _E, String obj, String lore) {
    if (mousePressed && Player.X >= objX && Player.X <= (objX + objW) && Player.Y >= objY && Player.Y <= (objY + objH)) {
      objTrade = true;
      objUsed = false;
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
    if (objTrade && objUsed && Player.Ore > 10 && mouseX >= width/6 && mouseX <= (width/6 + width/6) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Ore = Player.Ore - 10;
      Player.Cash = Player.Cash + _O;
      //resets objUsed to false
      objUsed = false;
    }
    //button 2(sell data)
    if (objTrade && objUsed && Player.Data > 5 && mouseX >= width/3 && mouseX <= (width/3 + width/6) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Data = Player.Data - 5;
      Player.Cash = Player.Cash + _D;
      //resets objUsed to false
      objUsed = false;
    }
    //button 3(buy health)
    if (objTrade && objUsed && Player.Cash > _H && Player.Health < 100 && mouseX >= width/2 && mouseX <= (width/2 + width/6) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Health = Player.Health + 2;
      Player.Cash = Player.Cash - _H;
      //resets objUsed to false
      objUsed = false;
    }
    //button 4(buy energy)
    if (objTrade && objUsed && Player.Cash > _E && Player.Energy < 100 && mouseX >= width/1.5 && mouseX <= (width/1.5 + width/6) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Energy = Player.Energy + 2;
      Player.Cash = Player.Cash - _E;
      //resets objUsed to false
      objUsed = false;
    }

    if (keyPressed) {
      objTrade = false;
    }
  }

  //code that allows for energy to be exchanged for resources on planets 
  void objUse(float _E1, float _O, float _E2, float _D, String obj, String lore) {
    if (mousePressed && Player.X >= objX && Player.X <= (objX + objW) && Player.Y >= objY && Player.Y <= (objY + objH)) {
      objMD = true;
      objUsed = false;
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
    if (objMD && objUsed && Player.Energy > _E1 && mouseX >= width/6 && mouseX <= (width/6 + width/3) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Energy = Player.Energy - _E1;
      Player.Ore = Player.Ore + _O;
      //resets objUsed to false
      objUsed = false;
    }
    //button 2(get data)
    if (objMD && objUsed && Player.Energy > _E2 && mouseX >= width/2 && mouseX <= (width/2 + width/3) && mouseY >= height/1.5 && mouseY <= (height/1.5 + height/12)) {
      Player.Energy = Player.Energy - _E2;
      Player.Data = Player.Data + _D;
      //resets objUsed to false
      objUsed = false;
    }

    if (keyPressed) {
      objMD = false;
    }
  }
}
