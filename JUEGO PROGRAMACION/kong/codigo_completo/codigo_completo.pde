PImage df;
PImage esce1;
PImage banana;
PImage mono;
int monoX = 100; // Posición en X del mono
int monoY = 350; // Posición en Y del mono
float monoVelY = 0; // Velocidad vertical del mono
float gravedad = 0.6; // Valor de la gravedad para simular el salto
boolean enElAire = false; // Variable para controlar si el mono está en el aire

void setup() {
  size(1000, 500);
  textAlign(CENTER, CENTER);
  df = loadImage("C:/Users/Acer/Documents/Processing/ITQ/JUEGO PROGRAMACION/imagenes/df.png");
  esce1 = loadImage("C:/Users/Acer/Documents/Processing/ITQ/JUEGO PROGRAMACION/imagenes/esce1.png");
  mono = loadImage("C:/Users/Acer/Documents/Processing/ITQ/JUEGO PROGRAMACION/imagenes/mono.png");
  banana = loadImage("C:/Users/Acer/Documents/Processing/ITQ/JUEGO PROGRAMACION/imagenes/banana.png");
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
  // Dibuja la "banana" en la nueva posición
  image(esce1, 0, 0); //Imagen de fondo//
  //Imagen de la banana//
  image(banana, bananaX, 200);
  image(banana, bananaX + 55, 200);
  image(banana, bananaX + 110, 200);

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

  // Dibuja al mono en la posición actual
  image(mono, monoX, monoY);

  // Restablece la posicion de banana cuando sale
  if (bananaX <= -100) {
    bananaX = 1000;
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

// asignación de teclas para los estados de pantalla del juego
void keyPressed() {
  if (juegoEstado == 'i' && key == 'p') {
    juegoEstado = 'p'; // Inicia el juego si se presiona "p"
  } else if (juegoEstado == 'o' && key == 'r') {
    juegoEstado = 'i'; // Reinicia el juego si se presiona "r"
  }

  // Movimiento del mono
  if (juegoEstado == 'p') {
    if (key == ' ') {
      if (!enElAire) {
        monoVelY = -15; // Velocidad inicial del salto (puedes ajustarla)
        enElAire = true;
      }
    } else if (keyCode == LEFT) {
      monoX -= 10; // Movimiento hacia la izquierda (ajusta el valor para cambiar la velocidad)
    } else if (keyCode == RIGHT) {
      monoX += 10; // Movimiento hacia la derecha (ajusta el valor para cambiar la velocidad)
    }
  } 
}

void keyReleased() {
  if (juegoEstado == 'p' && key == 'o') {
    juegoEstado = 'o'; //Aparece la pantalla "Game Over" si se presiona la tecla "o"
  }
}
