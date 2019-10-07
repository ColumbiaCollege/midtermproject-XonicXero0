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
  
  if(objY < -200){
    objY = height + 200; 
  }
  if(objY > height + 200){
    objY = -200; 
  }
  if(objX < -200){
    objX = width + 200; 
  }
  if(objX > width + 200){
    objX = -200; 
  }
  
  println(objY);
  }
}
