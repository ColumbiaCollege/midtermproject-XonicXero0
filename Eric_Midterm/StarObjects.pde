class Starobj {

  //variables
  PImage placeHolder;
  float objX;
  float objY;
  int objW;
  int objH;

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

  void objClick() {
    if (mousePressed && playerX >= objX && playerX <= (objX + objW) && playerY >= objY && playerY <= (objY + objH)) {
      playerEnergy = playerEnergy + 10;
    }
  }



}
