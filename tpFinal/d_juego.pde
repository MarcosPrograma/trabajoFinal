class Juego {
  //IMAGENES
  PImage estado11;
  //--------------- CAMPOS ---------------
  //Resize
  float tamX = width;
  float tamY = height;
  //Evaluacion start y end del juego
  boolean jugando = false;
  //LLAMAR A LAS DEMAS CLASES QUE ESTARAN DENTRO DEL JUEGO
  //Protagonista e enemigo principal
  IronmanJ jugador;
  ThanosJ thanos;
  Proyectil proyectil;
  // Arreglo de Enemigos == Naves enemigas
  int c = 5;
  Enemigos[] enemigos = new Enemigos[c];

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  Juego() {
    //DECLARAR LAS DEMAS CLASES
    for ( int i = 0; i < enemigos.length; i++ ) {
      enemigos[i] = new Enemigos();
      enemigos[i].reciclar(); //Comenzar desde 0
    }
    thanos = new ThanosJ();
    jugador = new IronmanJ();
    proyectil = new Proyectil();
    //Carga de imagenes
    estado11 = loadImage("estado11.png");
  }  

  //---------------METODOS---------------
  //DRAW DE LA CLASE
  void dibujar() {
    //DIBUJAR LA ESCENA DEL JUEGO
    if (aventuraGrafica.estado == 10) {
      image(estado11, width/2, height/2, tamX, tamY);
      //Dibujar a los personajes
      for ( int i = 0; i < enemigos.length; i++ ) { 
        enemigos[i].dibujar();
      }
      thanos.dibujar();
      jugador.dibujar();
    }
  }

  //MOVIMIENTO DE LOS OBJETOS DEL JUEGO
  void movimiento() {
    if (aventuraGrafica.estado == 10) {
      //Movimiento de ironman
      jugador.volarArriba();
      jugador.volarAbajo();
      //Movimiento de Thanos
      thanos.movimientoThanos();
    }
  }

  //ACTUALIZAR LOS VALORES
  void actualizar() {
    if (aventuraGrafica.estado == 10) {
      for ( int i = 0; i < enemigos.length; i++ ) { 
        //Actualizamos valores de los enemigos para volver a cargar nuevos
        enemigos[i].actualizar();
        //---- Colisión de los enemigos ----
        enemigos[i].destruir(jugador.proyectil);
      }
      //---- Colisión de  los objetos ----
      thanos.destruir(jugador.proyectil);
      jugador.destruir(enemigos);
    }
  }

  //RESET DEL JUEGO
  void jugando() {
    if (jugando == false) {
      jugador.yIronman = height/2;
      //proyectil.xProyectil = width/6 + 50;
      for ( int i = 0; i < enemigos.length; i++ ) { 
      enemigos[i].reciclar();
      }
    }
  }

  //---------- EVENTO DEL MOUSE ----------
  void mouse() {
    if (aventuraGrafica.estado == 10) {
      jugador.dispararCanon();
    }
  }
}
