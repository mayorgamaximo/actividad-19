// 🌟 ACTIVIDAD 19 - Gráficos, Animaciones e Interactividad
// Autor: [Tu Nombre]
// Fecha: Octubre 2025
// Materia: Proyecto de Implementación de Sitios web Dinámicos

// Variables para las elipses en movimiento
float x1, y1, x2, y2;
float xSpeed1 = 3.5, ySpeed1 = 2.8;
float xSpeed2 = -2.5, ySpeed2 = 3.2;
float diametro1 = 50, diametro2 = 40;

// Variables de color para las elipses
color colorElipse1, colorElipse2;

// Variables para las imágenes
PImage fondo, imagen;

// Variable para el modo de fondo
boolean fondoAlternativo = false;

void setup() {
  size(800, 600);
  
  // Cargar imágenes (comentar estas líneas si no tienes las imágenes)
  // fondo = loadImage("fondo.jpg");
  // imagen = loadImage("imagen.png");
  
  // Posiciones iniciales de las elipses
  x1 = width / 2;
  y1 = height / 2;
  x2 = width / 4;
  y2 = height / 4;
  
  // Colores iniciales
  colorElipse1 = color(255, 100, 100);
  colorElipse2 = color(100, 150, 255);
}

void draw() {
  // Dibujar el fondo
  if (fondoAlternativo) {
    // Fondo degradado alternativo
    for (int i = 0; i < height; i++) {
      float inter = map(i, 0, height, 0, 1);
      color c = lerpColor(color(20, 20, 60), color(80, 40, 100), inter);
      stroke(c);
      line(0, i, width, i);
    }
  } else {
    // Fondo degradado principal
    for (int i = 0; i < height; i++) {
      float inter = map(i, 0, height, 0, 1);
      color c = lerpColor(color(10, 30, 60), color(50, 20, 80), inter);
      stroke(c);
      line(0, i, width, i);
    }
  }
  
  // Mostrar imagen adicional si está cargada
  // if (imagen != null) {
  //   image(imagen, width - 100, 10, 80, 80);
  // }
  
  // Dibujar decoración en la esquina (reemplaza la imagen)
  dibujarDecoracion();
  
  // Dibujar la primera elipse que se mueve
  fill(colorElipse1);
  noStroke();
  ellipse(x1, y1, diametro1, diametro1);
  
  // Efecto de brillo
  fill(255, 255, 255, 100);
  ellipse(x1 - 10, y1 - 10, diametro1 * 0.4, diametro1 * 0.4);
  
  // Dibujar la segunda elipse
  fill(colorElipse2);
  ellipse(x2, y2, diametro2, diametro2);
  fill(255, 255, 255, 100);
  ellipse(x2 - 8, y2 - 8, diametro2 * 0.4, diametro2 * 0.4);
  
  // Actualizar posiciones
  x1 += xSpeed1;
  y1 += ySpeed1;
  x2 += xSpeed2;
  y2 += ySpeed2;
  
  // Rebote contra bordes - Elipse 1
  if (x1 > width - diametro1/2 || x1 < diametro1/2) {
    xSpeed1 *= -1;
    colorElipse1 = color(random(150, 255), random(50, 200), random(100, 255));
  }
  if (y1 > height - diametro1/2 || y1 < diametro1/2) {
    ySpeed1 *= -1;
    colorElipse1 = color(random(150, 255), random(50, 200), random(100, 255));
  }
  
  // Rebote contra bordes - Elipse 2
  if (x2 > width - diametro2/2 || x2 < diametro2/2) {
    xSpeed2 *= -1;
    colorElipse2 = color(random(100, 255), random(100, 255), random(150, 255));
  }
  if (y2 > height - diametro2/2 || y2 < diametro2/2) {
    ySpeed2 *= -1;
    colorElipse2 = color(random(100, 255), random(100, 255), random(150, 255));
  }
  
  // Dibujar iniciales
  drawInitials();
  
  // Instrucciones en pantalla
  fill(255, 255, 255, 200);
  textSize(12);
  textAlign(LEFT);
  text("Click izquierdo: Cambiar colores | Click derecho: Cambiar fondo", 10, height - 10);
}

// Función para dibujar las iniciales (personalizar con tus iniciales)
void drawInitials() {
  stroke(255, 255, 255, 230);
  strokeWeight(6);
  fill(100, 150, 255, 100);
  
  // Letra J (ejemplo - personalizar con tus iniciales)
  noFill();
  stroke(255, 255, 255, 230);
  strokeWeight(7);
  
  // J
  arc(130, 480, 60, 80, 0, PI);
  line(160, 440, 160, 480);
  
  // M (ejemplo)
  line(200, 500, 200, 440);
  line(200, 440, 230, 470);
  line(230, 470, 260, 440);
  line(260, 440, 260, 500);
  
  // Decoración adicional alrededor de las iniciales
  strokeWeight(2);
  stroke(255, 255, 100, 150);
  noFill();
  ellipse(130, 470, 100, 110);
  ellipse(230, 470, 140, 110);
}

// Función para dibujar decoración en la esquina
void dibujarDecoracion() {
  pushMatrix();
  translate(width - 60, 50);
  
  // Estrella decorativa
  fill(255, 255, 100, 200);
  noStroke();
  beginShape();
  for (int i = 0; i < 10; i++) {
    float angle = TWO_PI / 10 * i;
    float r = (i % 2 == 0) ? 30 : 15;
    float x = cos(angle + frameCount * 0.02) * r;
    float y = sin(angle + frameCount * 0.02) * r;
    vertex(x, y);
  }
  endShape(CLOSE);
  
  popMatrix();
}

// Interactividad con el mouse
void mousePressed() {
  if (mouseButton == LEFT) {
    // Click izquierdo: cambiar colores aleatorios
    colorElipse1 = color(random(100, 255), random(100, 255), random(100, 255));
    colorElipse2 = color(random(100, 255), random(100, 255), random(100, 255));
    
    // Cambiar velocidad aleatoriamente
    xSpeed1 = random(2, 5) * (random(1) > 0.5 ? 1 : -1);
    ySpeed1 = random(2, 5) * (random(1) > 0.5 ? 1 : -1);
  } else if (mouseButton == RIGHT) {
    // Click derecho: alternar fondo
    fondoAlternativo = !fondoAlternativo;
  }
}

// Interactividad adicional: teclas
void keyPressed() {
  if (key == ' ') {
    // Barra espaciadora: reset posiciones
    x1 = width / 2;
    y1 = height / 2;
    x2 = width / 4;
    y2 = height / 4;
  } else if (key == '+' || key == '=') {
    // Aumentar tamaño
    diametro1 = min(diametro1 + 5, 100);
    diametro2 = min(diametro2 + 5, 80);
  } else if (key == '-' || key == '_') {
    // Disminuir tamaño
    diametro1 = max(diametro1 - 5, 20);
    diametro2 = max(diametro2 - 5, 15);
  }
}