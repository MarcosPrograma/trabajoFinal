/*
FACULTAD DE ARTES - UNIVERSIDAD NACIONAL DE LA PLATA.
 TECNOLOGIA MULTIMEDIA 1 - DISEÑO MULTIMEDIAL| Prof. Matias Jauregui Lorda
 ALUMNOS: 
 JUÁREZ AGÜERO, Marcos Emmanuel (N.° de legajo: 85165/5).
 PERUGINI GUSTAVO (N.° de Legajo: 85154/1)       
 
 AVENTURA GRÁFICA + MINIJUEGO. 
*/

//IMPORTAR EL SONIDO EN FORMA GLOBAL
import processing.sound.*;

//DECLARAR la clase Aventura Grafica
AventuraGrafica aventuraGrafica;

void setup() {
  //fullScreen();
  //size(1200, 720); 
  size(800,600);

  //INICIAR la clase aventuraGrafica
  aventuraGrafica = new AventuraGrafica(this); //Haciendo USO del THIS para acceder al Sound
}

//Hacer el LLLAMADO del METODO
void draw() {
  //CONVOCAR la visualización de la aventuraGrafica
  aventuraGrafica.dibujar();
}

//CONVOCAR eventos de la aventuraGrafica
void mousePressed() {
  aventuraGrafica.mouse();
}

void keyPressed() {
  aventuraGrafica.teclado();
}
