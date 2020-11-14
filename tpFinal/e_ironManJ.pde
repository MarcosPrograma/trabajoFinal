class IronmanJ {
  //--------------- CAMPOS ---------------
  float xIronman, yIronman;
  float velY = 2;
  PImage ironman;
  //Llamar a "proyectil"
  Proyectil proyectil;

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  IronmanJ() {
    //DECLARAR LOS VALORES DE LAS VARIABLES
    xIronman = width/6;
    yIronman = height/2;
    //Carga de imagenes
    ironman = loadImage("ironmanVolador.png");
    //Otras clases
    proyectil = new Proyectil();
  }

  //--------------- METODOS ---------------
  void dibujar() {//DRAW Del OBJETO
    proyectil.dibujar();
    image(ironman, xIronman, yIronman);
  }

  //MOVIMIENTO
  void volarAbajo() { //Mover hacia abajo
    if ( keyCode == 'S' || keyCode == 's') {
      if (yIronman > height-80) {
      } else {
        yIronman += velY;
      }
    }
  }

  void volarArriba() { //Mover hacia arriba
    if ( keyCode == 'W' || keyCode == 'w') {
      if (yIronman < 80) {
      } else {
        yIronman -= velY;
      }
    }
  }

  void dispararCanon() { //Mover el proyectil
    proyectil.disparar();
  } 

  //Colisión
  void destruir() {
  }
}
