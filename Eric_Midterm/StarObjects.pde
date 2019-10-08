class Starobj {

  //variables
  PImage placeHolder;
  float objX;
  float objY;
  int objW;
  int objH;
  boolean objUsed = false;

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

  void objInter() {
    if (mousePressed && playerX >= objX && playerX <= (objX + objW) && playerY >= objY && playerY <= (objY + objH)) {
    }
  }

  //code that allows for energy to be exchanged for resources on objects 
  float objUse(float _R, float _C, float _A) {
    if (playerEnergy > _C && objUsed && playerX >= objX && playerX <= (objX + objW) && playerY >= objY && playerY <= (objY + objH)) {
      //makes the Rng ammount no insane 
      _A = floor(_A);
      playerEnergy = playerEnergy - _C;
      _R = _R +_A;
      //resets objUsed to false
      objUsed = false;
    }
    return _R;
  }
}
