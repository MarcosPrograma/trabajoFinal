class ThanosAV {
  //--------------- CAMPOS ---------------
  float xThanos, yThanos; 
  PImage thanos;

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  ThanosAV(float x, float y) {
    xThanos = x;
    yThanos = y;
    //Carga de imagenes
    thanos = loadImage("thanosAV.png");
  }

  //--------------- METODOS ---------------
  // DRAW DE LA CLASE
  void dibujar(){
    image(thanos, xThanos, yThanos);
  }
}
