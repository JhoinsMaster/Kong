void dibujaJugando() {
 // Mueve la "banana" hacia la (izquierda)
   bananaX -= 2; // valor para modificar la velocidad de banana//
  // Dibuja la "banana" en la nueva posición
  image(esce1, 0, 0);//Imagen de fondo//
  //Imagen de la banana//
  image(banana, bananaX, 200);
  image(banana, bananaX + 55, 200);
  image(banana, bananaX + 110, 200);
  // Restablece la posicion de banana cuando sale
  if (bananaX <= -100) {
    bananaX = 1000;
}
}
