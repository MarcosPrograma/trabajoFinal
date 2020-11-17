//-------------------- FUNCIONES REUTILIZABLES --------------------
void fuenteUna(String text, float x, float y, color c, int t) {
  pushStyle();
  textFont(aventuraGrafica.pixel);
  fill(c);
  textSize(t);
  text(text, x, y);
  popStyle();
}

void fuenteDos(String text, float x, float y, color c, int t) {
  pushStyle();
  textFont(aventuraGrafica.pixel2);
  fill(c);
  textSize(t);
  text(text, x, y);
  popStyle();
}

//-------------------- Reciclar VALORES de forma reutilizable = Animaciones meteoritos y lluvia de binarios --------------------
void reciclar( int r ) {
  aventuraGrafica.x[r] = random(width/24-100, width/0.9);
  aventuraGrafica.y[r] = height /24 - 200;
  aventuraGrafica.t[r] = random( 0, 15 );
  aventuraGrafica.v[r] = random( 0.1, 2.5 );
}
