class AventuraGrafica {
  //COPY PASTE == < >
  //--------------- Iniciar ATRIBUTOS ---------------
  //Fuentes
  PFont pixel, pixel2;
  //Imagenes
  PImage estado1, estado2, estado3, estado4, estado5, estado6, estado7, estado8, estado9, estado10, estado12, estado13, estado14, estado15;
  PImage encuadreOpcion;
  //Colores
  color amarillo;
  //--------------- CAMPOS ---------------
  int estado = 0;
  //Resize
  float tamX = width; 
  float tamY = height;
  //Convocar a otra clase
  Juego juego;

  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  AventuraGrafica() {
    //INICIAR LÓGICA DE ESTADO
    estado = 0; 
    //IMAGENES
    //PANTALLAS
    estado1 = loadImage("estado1.png"); 
    estado2 = loadImage("estado2.png");
    estado3 = loadImage("estado3.png");
    estado4 = loadImage("estado4.png");
    estado5 = loadImage("estado5.png");
    estado6 = loadImage("estado6.png");
    estado7 = loadImage("estado7.png");
    estado8 = loadImage("estado8.png");
    estado9 = loadImage("estado9.png");
    estado10 = loadImage("estado10.png");
    estado12 = loadImage("estado12.png");
    estado13 = loadImage("estado13.png");
    estado14 = loadImage("estado14.png");
    estado15 = loadImage("estado15.png");
    //DECORACION
    encuadreOpcion = loadImage("Opcion.png");
    //ATRIBUTOS
    imageMode(CENTER);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    //Colores
    amarillo = color(#FFD900);
    //Fuentes
    pixel = createFont("UAV-OSD-Mono.ttf", 18);
    pixel2 = createFont("Vdj.ttf", 18);
    //Declarar un nuevo Objeto == Llamar a otra clase
    juego = new Juego();
  }

  //--------------- METODOS ---------------
  // DRAW DE LA CLASE
  void dibujar() {
    //PANTALLA 1 - ESTADO 0 - Contextualización
    if (estado == 0) {
      pantalla1();
      //Texto
      fuenteUna("Presionar 'Barra Espaciadora' para iniciar", tamX/2, tamY/1.1, amarillo, 20);
    }
    //PANTALLA 2 - ESTADO 1 - Iron-man en la nave perdido en el espacio
    else if (estado == 1) {
      pantalla2();
      //Opciones
      image(encuadreOpcion, tamX/2 - 200, tamY/1.1);
      image(encuadreOpcion, tamX/2 + 200, tamY/1.1);
    }
    //PANTALLA 3 - ESTADO 2 - Marcar coordenadas
    else if (estado == 2) {
      pantalla3();
    }
    //PANTALLA 4 - ESTADO 3 - Pasar tiempo en la nave
    else if (estado == 3) {
      pantalla4();
      //Texto
      fuenteUna("Presionar 'R' para reiniciar", tamX/2, tamY/1.1, amarillo, 20);
    }
    //PANTALLA 5 - ESTADO 4 - Iron-Man en la tierra (elección)  
    else if (estado == 4) {
      pantalla5();
    }
    //PANTALLA 6 - ESTADO 5 - Crear una máquina del tiempo
    else if (estado == 5) {
      pantalla6();
    }
    //PANTALLA 7 - ESTADO 6 - Reparar la nave y viajar al espacio 
    else if (estado == 6) {
      pantalla7();
    }
    //PANTALLA 8 - ESTADO 7 - Ver el pasado (Reinicio)
    else if (estado == 7) {
      pantalla8();
    }
    //PANTALLA 9 - ESTADO 8 - Ver futuro (Hacia el final 1)
    else if (estado == 8) {
      pantalla9();
    }
    //PANTALLA 10 - ESTADO 9 - Contextualización del juego (Confrontación entre Thanos y los Avengers)
    else if (estado == 9) {
      pantalla10();
    }
    //PANTALLA 11 - ESTADO 10 - Minijuego
    else if (estado == 10) {
      juego.dibujar();
      juego.movimiento();
      juego.actualizar();
    }
    //PANTALLA 12 - ESTADO 11 - Final 1 (Ver lo ocurrido)
    else if (estado == 11) {
      pantalla12();
    }
    //PANTALLA 13 - ESTADO 12 - Final 2 (Ganan los avengers)
    else if (estado == 12) {
      pantalla13();
    }
    //PANTALLA 14 - ESTADO 13 - Final 3 (Gana Thanos)
    else if (estado == 13) {
      pantalla14();
    }
    //PANTALLA 15 - ESTADO 14 - Créditos
    else if (estado == 14) {
      pantalla15();
    }
  }

  // ------------------------ EVENTOS PARA EL MOUSEPRESSED O CLICKED ------------------------
  void mouse() {
    if (estado == 10) {
      juego.mouse();
    }
  }

  // ------------------------ EVENTOS PARA EL KEYPRESSED ------------------------
  void teclado() {
    //CAMBIAR ESTADOS
    //PANTALLA 1 - COMENZAR 
    if  ( estado == 0 ) {  
      if ( key == ' ' ) {
        estado = 1;
      } 
    }
    //PANTALLA 2 - Tony se encuentra en la Nave 
    else if (estado == 1) {
      if ( keyCode == LEFT) {
        estado = 2;
      } else if ( keyCode == RIGHT) {
        estado = 3;
      }
    }
    // PANTALLA 3 - Marcar coordenadas
    else if (estado == 2) {
      if ( keyCode == UP) {
        estado = 4;
      }
    }
    //Iron-man en la tierra
    else if (estado == 4) {
      if ( keyCode == LEFT) {
        estado = 5; //Máquina de tiempo
      } else if ( keyCode == RIGHT) {
        estado = 6; //Reparar la nave
      }
    }
    //Una vez creada la máquina del tiempo...
    else if (estado == 5) { 
      if ( keyCode == LEFT) {
        estado = 7; //Elegir viajar == Pasado
      } else if ( keyCode == RIGHT) {
        estado = 8; //Elegir viajar == Futuro
      }
    }
    //Reparar la nave y viajar al espacio 
    else if (estado == 6) { 
      if ( keyCode == UP) {
        estado = 9; //Confrotación junto a los Vengadores en el planeta Titán con Thanos
      }
    }
    //Comenzar el mini-juego
    else if (estado == 9){ 
      if ( keyCode == ENTER) {
        estado = 10; 
      }
    }
    //Saber lo ocurrido == Hacia el final 1
    else if (estado == 8){
      if ( keyCode == UP) { 
         estado = 11;
      }
    }
    //REINICIAR
    else if (estado == 3 || estado == 7 || estado == 14) { 
      if ( key == 'r' || key == 'R') {
        estado = 0;
      }
    }
    //CREDITOS
    else if (estado == 11 || estado == 12 || estado == 13) {
      if (key == ' '){
        estado = 14;
      }
    }
  }

  //------------------------ PANTALLAS ------------------------
  //ESTADO == PANTALLA 1 - Contextualizacion (Inicar con barra espaciadora)
  void pantalla1() {
    image(estado1, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 2 - Iron-man se encuentra en la nave perdido en el espacio
  void pantalla2() {
    image(estado2, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 3 - Marcar coordenadas
  void pantalla3() {
    image(estado3, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 4 - Pasar en tiempo en la nave
  void pantalla4() {
    image(estado4, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 5 - Iron-man se encuentra en la tierra
  void pantalla5() {
    image(estado5, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 6 - Crear una máquina del tiempo
  void pantalla6() {
    image(estado6, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 7 - Reparar la nave y viajar al espacio
  void pantalla7() {
    image(estado7, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 8 - Ver el pasado (Reiniciar)
  void pantalla8() {
    image(estado8, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 9 - Ver futuro (Hacia el final 1)
  void pantalla9() {
    image(estado9, width/2, height/2, tamX, tamY);
  }
  //ESTADO == PANTALLA 10 - Contextualización del minijuego y confrotación de los Avengers junto a Thanos
  void pantalla10() {
    image(estado10, width/2, height/2, tamX, tamY );
  }
  //ESTADO == PANTALLA 12 Final 1 (Ver lo ocurrido)
  void pantalla12() {
    image(estado12, width/2, height/2, tamX, tamY );
  }
  //ESTADO == PANTALLA 13 - Final 2 (Ganan los avengers)
  void pantalla13() {
    image(estado13, width/2, height/2, tamX, tamY );
  }
  //ESTADO == PANTALLA 14 - Final 3 (Gana Thanos)
  void pantalla14() {
    image(estado14, width/2, height/2, tamX, tamY );
  }
  //ESTADO == PANTALLA 15 - Créditos
  void pantalla15() {
    image(estado15, width/2, height/2, tamX, tamY);
  }
}
