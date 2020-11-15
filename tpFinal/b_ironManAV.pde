class IronmanAV {
  //--------------- CAMPOS ---------------
  float xIronman, yIronman;  
  PImage ironman;

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  IronmanAV(float x, float y) {
    xIronman = x;
    yIronman = y;
    //Cargar imágenes
    ironman = loadImage("ironmanAV.png");
  }

  //--------------- METODOS ---------------
  // DRAW DE LA CLASE
  void dibujar() {
    image(ironman, xIronman, yIronman);
  }
}
