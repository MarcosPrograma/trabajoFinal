class Enemigos {
  //--------------- CAMPOS ---------------
  float xEnemigos, yEnemigos;
  float velocidad;
  //IMAGENES
  PImage enemigos; 

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  Enemigos() {
    //Declarar las variables con valores random
    xEnemigos = random(width/0.9); 
    yEnemigos = random(height/6.5, height/1); 
    velocidad = random(-3, -1);  
    //Carga de imagenes
    enemigos = loadImage("navesEnemigas.png");
  }

  //--------------- METODOS ---------------
  void actualizar() { //Movimiento de las naves & volver al inicio una vez cruzada la pantalla
    xEnemigos = xEnemigos + velocidad;
    if ( xEnemigos < width/24-100) { 
      reciclar();
    }
  }

  void dibujar() { //DRAW DEL OBJETO
    image(enemigos, xEnemigos, yEnemigos);
  }

  void reciclar() { //Volver el valor de las propiedades a Random
    xEnemigos = width/0.95; 
    yEnemigos = random(height/6.5, height/1);
    velocidad = random(-3, -1);
  }

  //--------------- Colisión ---------------
  void destruir(Proyectil p) {
    float d = dist (xEnemigos, yEnemigos, p.xProyectil, p.yProyectil);
    if (d < yEnemigos/6) {
      reciclar();
    }
  }
}
