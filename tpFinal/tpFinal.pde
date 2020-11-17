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
  //size(1200, 720); //resize = uso de variables o width/height
  size(800, 600);

  //HACER EL USO DEL THIS PARA EL SONIDO

  //INICIAR la clase aventuraGrafica
  aventuraGrafica = new AventuraGrafica(this);
}

//Hacer el LLLAMADO de cada uno de los METODOS
void draw() {
  //CONVOCAR la visualización de la aventuraGrafica
  aventuraGrafica.dibujar();
}

void mousePressed() {
  aventuraGrafica.mouse();
}

void keyPressed() {
  aventuraGrafica.teclado();
}
