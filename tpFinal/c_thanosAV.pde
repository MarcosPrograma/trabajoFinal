class ThanosAV {
  //--------------- CAMPOS ---------------
  PImage thanos;

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  ThanosAV() {
    //Carga de imagenes
    thanos = loadImage("thanosAV.png");
  }

  //--------------- METODOS ---------------
  // DRAW DE LA CLASE
  void dibujar(float xThanos, float yThanos){
    image(thanos, xThanos, yThanos);
  }
}
