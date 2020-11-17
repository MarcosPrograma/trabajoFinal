class Proyectil {
  //OBJETO ADJUNTO AL PROTAGONISTAA (IRONMAN)
  //--------------- CAMPOS ---------------
  float xProyectil, yProyectil;
  float movProyectil;
  //IMAGENES
  PImage proyectil;

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  Proyectil() {
    //Declarar las variables
    xProyectil = width/6 + 50;
    yProyectil = height/2;
    movProyectil = 3;
    //Carga de imagenes
    proyectil = loadImage("proyectilRedondo.png");
  }

  //--------------- METODOS ---------------
  void dibujar() { //DRAW DEL OBJETO
    image(proyectil, xProyectil, yProyectil);
  }

  //Movimiento del proyectil
  void disparar() {
      xProyectil = xProyectil + movProyectil;
  }
}
