  // asignación de teclas para los estados de pantalla del juego
void keyPressed() {

  if (juegoEstado == 'i' && key == 'p') {
    juegoEstado = 'p'; // Inicia el juego si se presiona "p"
  } else if (juegoEstado == 'o' && key == 'r') {
    juegoEstado = 'i'; // Reinicia el juego si se presiona "r"
  }
}

void keyReleased() {
  if (juegoEstado == 'p' && key == 'o') {
    juegoEstado = 'o'; //Aparece la pantalla "Game Over" si se presiona la tecla "o"
  }
}
