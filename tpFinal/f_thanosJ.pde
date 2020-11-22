class ThanosJ {
  //--------------- CAMPOS ---------------
  float xThanos, yThanos;
  float velY = 1;
  PImage thanos;

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  ThanosJ() {
    //DECLARAR LOS VALORES DE LAS VARIABLES
    xThanos = width/1.2;
    yThanos = height/2;
    //Carga de imagenes
    thanos = loadImage("Thanos.png");
  }

  //--------------- METODOS ---------------
  void dibujar() { //DRAW DE LA CLASE
    image(thanos, xThanos, yThanos);
  }

  // Movimiento del Personaje = REBOTE
  void movimientoThanos() { 
    yThanos = yThanos+velY;
    if (yThanos > height - 100) {  // Si toca abajo 
      yThanos = height - 100; 
      velY=-velY;
    } else if (yThanos < 100) {  // Si toca arriba 
      yThanos = 100; 
      velY=-velY;
    }
  }

  //--------------- Colisión ---------------
  void destruir(Proyectil p) {
    float d = dist( xThanos, yThanos, p.xProyectil, p.yProyectil);
    if (d < xThanos/5 && d < yThanos/4) {
      aventuraGrafica.estado = 12;
      aventuraGrafica.musicaJuego.stop();
      aventuraGrafica.soyIronman.play();
      aventuraGrafica.musicaGanar.play();
      p.xProyectil = width/6 + 50;
      println("ganaste");
    }
  }
}  
