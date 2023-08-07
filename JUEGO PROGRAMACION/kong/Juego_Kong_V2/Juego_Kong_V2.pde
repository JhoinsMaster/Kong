PImage df;
PImage esce1;
PImage banana;
PImage mono;
int monoX = 100; // Posición en X del mono
int monoY = 350; // Posición en Y del mono
float monoVelY = 0; // Velocidad vertical del mono
float monoVelX = 3; // Velocidad horizontal del mono (puedes ajustarla)
float gravedad = 0.7; // Valor de la gravedad para simular el salto
boolean enElAire = false; // Variable para controlar si el mono está en el aire

// Variables para el movimiento de la cámara
float camX = 0;
float camY = 0;
float esce1X=0;

void setup() {
  size(1000, 500);
  textAlign(CENTER, CENTER);
  df = loadImage("C:/Users/Estudiante/Desktop/JUEGO PROGRAMACION/imagenes/df.png");
  esce1 = loadImage("C:/Users/Estudiante/Desktop/JUEGO PROGRAMACION/imagenes/esce1.png");
  mono = loadImage("C:/Users/Estudiante/Desktop/JUEGO PROGRAMACION/imagenes/mono.png");
  banana = loadImage("C:/Users/Estudiante/Desktop/JUEGO PROGRAMACION/imagenes/banana.png");
}

char juegoEstado = 'i'; // 'i' para pantalla de inicio, 'p' para pantalla jugando, 'o' para pantalla Game Over
int bananaX = 700;

void draw() {
  //Estados de la pantalla videojuego
  switch (juegoEstado) {
    case 'i': // Pantalla de inicio
      dibujaInicio();
      break;
    case 'p': // Pantalla jugando
      dibujaJugando();
      break;
    case 'o': // Pantalla Game Over
      dibujaGameOver();
      break;
  }
}

void dibujaInicio() {
  image(df, 0, 0);
  fill(100);
  rect(350, 225, 300, 100);
  fill(120, 255, 100);
  textSize(30);
  text("Kong's Banana Rush", width/2, height/2);
  fill(0);
  textSize(20);
  text("Presiona 'P' para jugar", width/2, height/2 + 40);
}

void dibujaJugando() {

  // Mueve la "banana" hacia la (izquierda)
  bananaX -= 2; // valor para modificar la velocidad de banana//
  // Mueve "esce1" idénticamente a "banana"
  camX -= 0.5;
 // esce1X -=0.5;

  // Simulación de salto del mono
  if (enElAire) {
    monoVelY += gravedad;
    monoY += monoVelY;
    if (monoY >= 350) {
      monoY = 350;
      monoVelY = 0;
      enElAire = false;
    }
  }

  // Movimiento del mono en el eje X
  monoX += monoVelX; // Puedes modificar este valor para cambiar la velocidad del mono en el eje X

  // Dibuja al mono en la posición actual
  pushMatrix();
  translate(camX, camY); // Aplica el movimiento de la cámara
  image(esce1, 0, 0); // Imagen de fondo con el movimiento de cámara
  // Imagen de la banana con el movimiento de cámara
  image(banana, bananaX + camX, 200);
  image(banana, bananaX + 55 + camX, 200);
  image(banana, bananaX + 110 + camX, 200);
  image(mono, monoX, monoY);

      fill(125,200,0);
      textSize(40);
      text("Score: ",60,100,camX );
  popMatrix();

  // Restablece la posición de banana cuando sale
  if (bananaX <= -100) {
    bananaX = 1000;
    if (monoX <= 975) {
      monoX = -10;
  }
}
}
void dibujaGameOver() {
  background(205, 25, 120);
  fill(0);
  textSize(30);
  text("PANTALLA GAME OVER", width/2, height/2);
  textSize(20);
  text("Presiona 'R' para reiniciar", width/2, height/2 + 40);
}

// Asignación de teclas para los estados de pantalla del juego
void keyPressed() {
  if (juegoEstado == 'i' && key == 'p') {
    juegoEstado = 'p'; // Inicia el juego si se presiona "p"
  } else if (juegoEstado == 'o' && key == 'r') {
    juegoEstado = 'i'; // Reinicia el juego si se presiona "r"
  }

  // Movimiento del mono
  if (juegoEstado == 'p') {
    if (key == 'w' || key == 'W') {
      if (!enElAire) {
        monoVelY = -15; // Velocidad inicial del salto (puedes ajustarla)
        enElAire = true;
      }
    }
  }
}

void keyReleased() {
  if (juegoEstado == 'p' && key == 'o') {
    juegoEstado = 'o'; //Aparece la pantalla "Game Over" si se presiona la tecla "o"
  }
}
