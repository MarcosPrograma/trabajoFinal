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
