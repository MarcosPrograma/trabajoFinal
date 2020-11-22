class AventuraGrafica {
  //COPY PASTE == < >
  //--------------- Iniciar ATRIBUTOS ---------------
  //Fuentes
  PFont pixel, pixel2;
  //Imagenes
  PImage estado1, estado2, estado3, estado4, estado5, estado6, estado7, estado8, estado9, estado10, estado12, estado13, estado14, estado15;
  PImage encuadreOpcion, encuadreDialogo;
  PImage naveFicticia;
  //Colores
  color amarillo, rojo, negro, verde, violeta, blanco;
  //--------------- ESTÉTICA ---------------
  //Créditos
  float mPosY = height/2;
  //Arays para animaciones
  int cA = 10;
  float[] x = new float[cA];
  float[] y = new float[cA];
  float[] t = new float[cA];
  float[] v = new float[cA];
  PImage[] binarios = new PImage[cA];
  PImage[] meteoro = new PImage[cA];
  //--------------- SONIDO ---------------
  SoundFile musicaFondo, musicaJuego, musicaGanar, musicaPerder;
  SoundFile soyInevitable, soyIronman;
  //--------------- CAMPOS ---------------
  int estado = 0;
  //Resize
  float tamX = width; 
  float tamY = height;
  //Convocar a otra clase
  Juego juego; //Mini-juego
  IronmanAV ironmanAV; //Protagonista == Aventura gráfica
  ThanosAV thanosAV; //Enemigo == Aventura gráfica


  //--------------- CONSTRUCTOR - SETUP DE LA CLASE ---------------
  AventuraGrafica(PApplet sound) {
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
    encuadreDialogo = loadImage("recuadreDialogo.png");
    naveFicticia = loadImage("Nave ficticia.png");
    //ATRIBUTOS
    imageMode(CENTER);
    textAlign(CENTER, CENTER);
    //Colores
    rojo = color(255, 0, 0);
    negro = color(0);
    blanco = color(255); 
    amarillo = color(#FFD900);
    verde = color(#23FF03);
    violeta = color(#510062);
    //Fuentes
    pixel = createFont("UAV-OSD-Mono.ttf", 18);
    pixel2 = createFont("Vdj.ttf", 18);
    //ESTETICA
    //Iniciar animaciones = primeros valores
    //Animaciones == inicio - Num. binarios
    for ( int i = 0; i < cA; i++ ) {
      x[i] = random(width/24-100, width/0.9);
      y[i] = height /24 - 200;
      t[i] = random( 0, 15 );
      v[i] = random( 0.1, 2.5 );
      binarios[i] = loadImage( "ceroyunos.png" );
    }
    //Animaciones == inicio - Meteoritos
    for ( int i = 0; i < cA; i++ ) {
      x[i] = random(width/24-100, width/0.9);
      y[i] = height /24 - 200;
      t[i] = random( 0, 15 );
      v[i] = random( 0.1, 2.5 );
      meteoro[i] = loadImage( "meteorito.png" );
    }
    //Declarar un nuevo Objeto == Llamar a otra clase
    juego = new Juego();
    ironmanAV = new IronmanAV();
    thanosAV = new ThanosAV();
    //-------- Sonido (¡LIBRERIA GRATUITA DE YOUTUBE!) -------- 
    //Musica de fondo según el contexto
    musicaFondo = new SoundFile(sound, "Getaway Powder - DJ Freedem.mp3");
    musicaJuego = new SoundFile(sound, "Desert Brawl - Vans in Japan.mp3");
    musicaGanar = new SoundFile(sound, "Saving the World - Aaron Kenny.mp3");
    musicaPerder = new SoundFile(sound, "Through and Through - Amulets.mp3");
    //Efectos de sonido
    soyInevitable = new SoundFile(sound, "Yo soy inevitable.wav");
    soyIronman = new SoundFile(sound, "Yo soy ironman.wav");
    //Comenzar la reproducición
    musicaFondo.play();
  }

  //--------------- METODOS ---------------
  // DRAW DE LA CLASE
  void dibujar() {
    //PANTALLA 1 - ESTADO 0 - Contextualización
    if (estado == 0) {
      pantalla1();
      //Dialogo
      fuenteDos( "En algún lugar del recóndito espacio, se encuentra \n Tony Stark vagando en su nave averiada, \n este mismo debe volver al planeta tierra \n para poder salvar al mundo de las garras \n del gigante malévolo “Thanos”, el cual tiene \n en mente destruir a la mitad de la población \n con su guante y las gemas del infinito.", width/2, mPosY, blanco, 18);
      fuenteDos("¿Estarías dispuesto a ayudar a Iron Man \n en tomar las decisiones correctas? \n Solo tú puedes salvar el mundo.", width/2, mPosY + 150, blanco, 18);
      fuenteDos("Emplea las flechas de tu teclado para desplazarte \n por la Aventura Gráfica.", width/2, mPosY + 225, verde, 18);
      //REINICIAR Dialogo
      if (mPosY == height /24 - 300) {
        mPosY = height/0.8;
      }
      //Opción
      fuenteUna("Presionar 'Barra Espaciadora' para iniciar", tamX/2, tamY/1.1, amarillo, 20);
    }
    //PANTALLA 2 - ESTADO 1 - Iron-man en la nave perdido en el espacio
    else if (estado == 1) {
      pantalla2();
      //Opciones
      image(encuadreOpcion, tamX/2 - 200, tamY/1.1);
      image(encuadreOpcion, tamX/2 + 200, tamY/1.1);
      fuenteDos("Jugar en la \n nave", width/2 + 200, tamY/1.1, negro, 15);
      fuenteDos("Fabricar \n teletransportacion", width/2 - 200, tamY/1.1, negro, 15);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Iron Man:", width/2, height/13, amarillo, 18);
      fuenteDos("Nuestra nave tiene varios \n problemas y no contamos con los \n recursos necesarios para \n repararla, pero tengo mis \n herramientas esenciales.", width/2, height/5, negro, 18);
    }
    //PANTALLA 3 - ESTADO 2 - Marcar coordenadas
    else if (estado == 2) {
      pantalla3();
      //Opciones
      image(encuadreOpcion, tamX/2, tamY/1.1);
      fuenteDos("Marcar coordenadas", width/2, tamY/1.1, negro, 15);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Iron Man:", width/2, height/13, amarillo, 18);
      fuenteDos("Con la ayuda de estas y mi \n conocimiento avanzado en ingeniera, \n podríamos utilizar mi Smartphone \n y crear un dispositivo de \n teletransportación, y de esta \n manera ir a la tierra", width/2, height/4.5, negro, 18);
    }
    //PANTALLA 4 - ESTADO 3 - Pasar tiempo en la nave
    else if (estado == 3) {
      pantalla4();
      //Opción
      fuenteUna("Presionar 'R' para reiniciar", tamX/2, tamY/1.1, blanco, 20);
      //Movimiento e interacción de la nave fictica
      float posX = map(mouseX, 0, width, width/3, width/1.5);
      image(naveFicticia, posX, height/3.5);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Iron Man:", width/2, height/13, amarillo, 18);
      fuenteDos("Muy divertido, pero \n nuestra misión es otra…", width/2, height/6, negro, 18);
    }
    //PANTALLA 5 - ESTADO 4 - Iron-Man en la tierra (elección)  
    else if (estado == 4) {
      pantalla5();
      ironmanAV.dibujar(tamX/2, tamY/1.45);
      //Opciones
      image(encuadreOpcion, tamX/2 - 200, tamY/1.1);
      image(encuadreOpcion, tamX/2 + 200, tamY/1.1);
      fuenteDos("Arreglar la \n nave", width/2 + 200, tamY/1.1, negro, 15);
      fuenteDos("Fabricar \n máquina del tiempo", width/2 - 200, tamY/1.1, negro, 15);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Iron Man:", width/2, height/13, amarillo, 18);
      fuenteDos("Se me ocurren dos soluciones,\n la primera es construir una \n máquina del tiempo, e intentar \n encontrar una manera más \n fácil de ganar. La segunda \n es reparar la nave y buscar \n a Thanos en el universo.", width/2, height/4.5, negro, 18);
    }
    //PANTALLA 6 - ESTADO 5 - Crear una máquina del tiempo
    else if (estado == 5) {
      pantalla6();
      ironmanAV.dibujar(tamX/1.2, tamY/1.45);
      //Opciones
      image(encuadreOpcion, tamX/2 - 200, tamY/1.1);
      image(encuadreOpcion, tamX/2 + 200, tamY/1.1);
      fuenteDos("Ver el futuro", width/2 + 200, tamY/1.1, negro, 15);
      fuenteDos("Ver el pasado", width/2 - 200, tamY/1.1, negro, 15);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Iron Man:", width/2, height/13, amarillo, 18);
      fuenteDos("Me alegro de haber vislumbrado \n los avances de Emmet Brown \n en la ciencia del tiempo. \n ¿Crees que deberíamos ver \n el pasado o el futuro?", width/2, height/5, negro, 18);
    }
    //PANTALLA 7 - ESTADO 6 - Reparar la nave y viajar al espacio 
    else if (estado == 6) {
      pantalla7();
      ironmanAV.dibujar(tamX/3.5, tamY/1.45);
      //Opciones
      image(encuadreOpcion, tamX/2, tamY/1.1);
      fuenteDos("Mandar señal\ny viajar", width/2, tamY/1.1, negro, 15);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Iron Man:", width/2, height/13, amarillo, 18);
      fuenteDos("Estando en casa esto es mucho \n más fácil… \n Deberíamos mandar una señal \n a los vengadores", width/2, height/5, negro, 18);
    }
    //PANTALLA 8 - ESTADO 7 - Ver el pasado (Reinicio)
    else if (estado == 7) {
      pantalla8(); 
      //Animaciones
      //Actualización de los meteoritos
      for (int i = 0; i < cA; i++) {
        y[i] = y[i] + t[i];
        if (y[i] > height/1.3 ) {
          reciclar(i);
        }
      }
      //Dibujar meteoritos
      for ( int j = 0; j < cA; j++ ) {
        image( meteoro[j], x[j], y[j] );
      }
      //Mostrar a Ironman
      ironmanAV.dibujar(tamX/1.2, tamY/1.45);
      //Opciones
      fuenteUna("Presionar 'R' para reiniciar", tamX/2, tamY/1.1, negro, 20);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Iron Man:", width/2, height/13, amarillo, 18);
      fuenteDos("Esto le hubiese servido \n a los objetivos de Jhon Hammond, \n pero no para nuestros fines.", width/2, height/5, negro, 18);
    }
    //PANTALLA 9 - ESTADO 8 - Ver futuro (Hacia el final 1)
    else if (estado == 8) {
      pantalla9();
      //Animaciones
      //Animaciones de lluvia de binarios
      for ( int i = 0; i < cA; i++ ) {
        y[i] = y[i] + t[i];
        if (y[i] > height/1.3 ) {
          reciclar( i );
        }
      }
      //Dibujar lluvia de binarios
      for ( int j = 0; j < cA; j++ ) {
        image( binarios[j], x[j], y[j] );
      }
      //Mostrar a Ironman
      ironmanAV.dibujar(tamX/1.2, tamY/1.45);
      //Opciones
      image(encuadreOpcion, tamX/2, tamY/1.1);
      fuenteDos("Ver lo ocurrido", width/2, tamY/1.1, negro, 15);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Iron Man:", width/2, height/13, amarillo, 18);
      fuenteDos("¿¡Qué rayos ocurrió aquí!? \n ¿¡Thanos fue derrotado!?", width/2, height/5, negro, 18);
    }
    //PANTALLA 10 - ESTADO 9 - Contextualización del juego (Confrontación entre Thanos y los Avengers)
    else if (estado == 9) {
      pantalla10();
      ironmanAV.dibujar(tamX/1.2, tamY/1.45);
      //Opciones
      image(encuadreOpcion, tamX/2, tamY/1.1);
      fuenteDos("'Enter'\npara jugar", width/2, tamY/1.1, negro, 15);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Narrador:", width/2, height/13, blanco, 18);
      fuenteDos("Has viajado al planeta Titán \n y deberás pelear mano a mano \n contra Thanos. Pulsa 'W' y \n 'S' para desplazarte. Utiliza el \n click derecho para mover el \n plasma. ¡OJO, QUE NO TE TOQUEN SUS \n ALIADOS!", width/2, height/4.5, negro, 18);
    }
    //PANTALLA 11 - ESTADO 10 - Minijuego
    else if (estado == 10) {
      juego.jugando();
      juego.jugando = true;
      juego.dibujar();
      juego.movimiento();
      juego.actualizar();
    }
    //PANTALLA 12 - ESTADO 11 - Final 1 (Ver lo ocurrido)
    else if (estado == 11) {
      juego.jugando = false;
      pantalla12();    
      //Animaciones
      //Animaciones de lluvia de binarios
      for ( int i = 0; i < cA; i++ ) {
        y[i] = y[i] + t[i];
        if (y[i] > height/1.3 ) {
          reciclar( i );
        }
      }
      //Dibujar lluvia de binarios
      for ( int j = 0; j < cA; j++ ) {
        image( binarios[j], x[j], y[j] );
      }
      //Dibujar a Ironman
      ironmanAV.dibujar(tamX/1.2, tamY/1.45);
      fuenteDos("¿?", tamX/1.2, tamY/1.78, negro, 20); 
      //Ir hacia los créditos
      fuenteUna("Presionar 'Barra espaciadora' para \n ver el reconocimiento", tamX/2, tamY/1.1, amarillo, 20);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Narrador:", width/2, height/13, blanco, 18);
      fuenteDos("En un futuro muy lejano… El \n malévolo gigante quedo hecho \n cenizas a causa de un resfriado. \n Se comenta que un tal Tony Stark \n generó un arma biológica que \n destruyó su sistema inmunológico… \n Lo demás vino solo.", width/2, height/4.5, negro, 18);
    }
    //PANTALLA 13 - ESTADO 12 - Final 2 (Ganan los avengers)
    else if (estado == 12) {
      juego.jugando = false;
      pantalla13();
      ironmanAV.dibujar(tamX/1.2, tamY/1.45);
      //Ir hacia los créditos
      fuenteUna("Presionar 'Barra espaciadora' para \n ver el reconocimiento", tamX/2, tamY/1.1, blanco, 20);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Narrador:", width/2, height/13, blanco, 18);
      fuenteDos("Posterior a una pelea sumamente \n reñida por parte de ambos bandos, \n el grupo de héroes consiguen \n hacerse con la única probabilidad \n de quedarse con la victoria… \n ¡Vengadores unidos jamás serán \n vencidos!", width/2, height/4.5, negro, 18);
    }
    //PANTALLA 14 - ESTADO 13 - Final 3 (Gana Thanos)
    else if (estado == 13) {
      juego.jugando = false;
      pantalla14();
      thanosAV.dibujar(tamX/1.2, tamY/1.45);
      //Ir hacia los créditos
      fuenteUna("Presionar 'Barra espaciadora' para \n ver el reconocimiento", tamX/2, tamY/1.1, blanco, 20);
      //Dialogo
      image(encuadreDialogo, tamX/2, tamY/5);
      fuenteDos("Thanos:", width/2, height/13, violeta, 18);
      fuenteDos("A pesar de todo, fue un acto \n honorable por parte del Sr. \n Stark… Una pequeña prueba de que \n este humano tiene corazón.", width/2, height/5, negro, 18);
    }
    //PANTALLA 15 - ESTADO 14 - Créditos
    else if (estado == 14) {
      juego.jugando = false;
      pantalla15();
      //Dialogo
      fuenteDos("Horneado por Marcos. E. Juárez Agüero \n y Gustavo Perugini", width/2, mPosY - 100, rojo, 18);
      fuenteDos("IDE: Processing.", width/2, mPosY - 50, violeta, 18);
      fuenteDos("Un presente para los profesores Matias Jauregui \n Lorda y Tobías Albirosa (espero que cuando Thanos \n chasquee los dedos, sean del %50 de la población \n que no desaparece)", width/2, mPosY + 25, 255, 18);
      fuenteDos("Tecnologia Multimedial 1 - COM. 2 UNLP - FDA", width/2, mPosY + 100, verde, 18);
      //Título == IRON SOLDIER = LA ULTIMA POSIBILIDAD
      image(encuadreDialogo, tamX/2, tamY/8);
      fuenteUna("Iron Soldier", tamX/2, tamY/7, amarillo, 40);
      fuenteDos("la última posibilidad", tamX/2, tamY/12.5, blanco, 14);
      //REINICIAR Dialogo
      if (mPosY == height /24 - 300) {
        mPosY = height/0.8;
      }
      //Opción
      fuenteUna("Presionar 'R' para volver a empezar", tamX/2, tamY/1.1, amarillo, 20);
    }

    //-------- Actualizar valores estéticos --------
    mPosY -= 1;
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
    else if (estado == 9) { 
      if ( keyCode == ENTER) {
        estado = 10;
        //Cambiar la música
        musicaFondo.stop();
        musicaJuego.play();
      }
    }
    //Saber lo ocurrido == Hacia el final 1
    else if (estado == 8) {
      if ( keyCode == UP) { 
        estado = 11;
        //CAMBIAR la música
        musicaFondo.stop();
        musicaGanar.play();
      }
    }
    //REINICIAR
    else if (estado == 3 || estado == 7) { 
      if ( key == 'r' || key == 'R') {
        estado = 0;
        //REINICIAR los valores de las variables
        mPosY = height /24 - 300;
        //REINICIAR la música
        musicaFondo.stop();
        musicaFondo.play();
        println("Las variables se han reseteado");
      }
    }
    //CREDITOS
    else if (estado == 11 || estado == 12 || estado == 13) {
      if (key == ' ') {
        estado = 14;
        //REINICIAR los valores de las variables
        mPosY = height /24 - 300;
        println("Las variables se han reseteado");
      }
    }
    //VOLVER a EMPEZAR
    else if (estado == 14) {
      if (key == 'r' || key == 'R') {
        estado = 0;
        //REINICIAR los valores de las variables
        mPosY = height /24 - 300;
        println("Las variables se han reseteado");
        //REINICIAR la música
        musicaFondo.play();
        musicaPerder.stop();
        musicaGanar.stop();
        //REINICIAR los efectos de sonido
        soyInevitable.stop();
        soyIronman.stop();
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

  //------------------------ FUNCIONES REUTILIZABLES ------------------------

  //------------------------ FUENTES ------------------------
  void fuenteUna(String text, float x, float y, color c, int t) {
    pushStyle();
    textFont(pixel);
    fill(c);
    textSize(t);
    text(text, x, y);
    popStyle();
  }

  void fuenteDos(String text, float x, float y, color c, int t) {
    pushStyle();
    textFont(pixel2);
    fill(c);
    textSize(t);
    text(text, x, y);
    popStyle();
  }

  //-------------------- Reciclar VALORES de forma reutilizable = Animaciones meteoritos y lluvia de binarios --------------------
  void reciclar( int r ) {
    x[r] = random(width/24-100, width/0.9);
    y[r] = height /24 - 200;
    t[r] = random( 0, 15 );
    v[r] = random( 0.1, 2.5 );
  }
}
