// Variable para los estados del juego
char juegoEstado = 'i'; // 'i' para pantalla de inicio, 'p' para pantalla jugando, 'o' para pantalla Game Over
int bananaX = 700;
void draw() {
 
  //Estados de la pantalla videojuego
  switch (juegoEstado) {
    case 'i': // Pantalla de inicio
      dibujaInicio();
      break;
    case 'p' : // Pantalla jugando
      dibujaJugando();
      break;
    case 'o': // Pantalla Game Over
      dibujaGameOver();
      break;
  }
}
