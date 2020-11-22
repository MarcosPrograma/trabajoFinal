class IronmanAV {
  //--------------- CAMPOS ---------------
  PImage ironman;

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  IronmanAV() {
    //Cargar imágenes
    ironman = loadImage("ironmanAV.png");
}

  //--------------- METODOS ---------------
  // DRAW DE LA CLASE
  void dibujar(float xIronman, float yIronman) {
    image(ironman, xIronman, yIronman);
  }
}
