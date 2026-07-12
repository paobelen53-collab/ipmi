//https://youtu.be/4r8wUo4Farg?si=hc-JMyj7QRdUPl-0
PImage imgRef;
float angulo = 0; 
boolean mostrar = true; 
float factorRandom = 0; 

void setup() {
  size(800, 400);
  imgRef = loadImage("21.jpg"); 
}

void draw() {
  background(255);
  image(imgRef, 0, 0, 400, 400);
  
  if (mostrar) { 
    
    drawFondoMallaAnidada();
    
    
    angulo += map(mouseX, 0, width, 0.02, 0.12); 
    
   
    drawFondoLineas(); 
    
    
    drawTodasLasEsferas();
    
   
    drawLineasSuperiores();
    
  } else { 
    fill(0); 
    textAlign(CENTER, CENTER);
    textSize(20);
    text("volver a ver", 600, 200); 
  } 
}
 
void drawFondoMallaAnidada() {
  for (int x = 400; x <= 800; x += 15) {
    for (int y = 0; y <= height; y += 15) {
      float d = dist(mouseX, mouseY, x, y);
      if (d < 80) {
        stroke(200, 100, 100, 150);
        strokeWeight(2);
        point(x + factorRandom, y); 
      }
    }
  }
}

void drawFondoLineas() {
  strokeWeight(5);
  for (int y = 0; y < height; y += 12) {
    stroke(0, 230, 70); line(400, y, 800, y);      
    stroke(255, 40, 40); line(400, y + 4, 800, y + 4); 
    stroke(0, 100, 255); line(400, y + 8, 800, y + 8); 
  }
}

void drawTodasLasEsferas() {
  float tam = calcularTamano(70); 
  
  dibujarEsferaRotatoria3D(480, 70, tam);
  dibujarEsferaRotatoria3D(605, 70, tam);
  dibujarEsferaRotatoria3D(750, 70, tam);
  
  dibujarEsferaRotatoria3D(415, 150, tam);
  dibujarEsferaRotatoria3D(660, 150, tam);
  
  dibujarEsferaRotatoria3D(560, 215, tam);
  dibujarEsferaRotatoria3D(785, 215, tam);
  
  dibujarEsferaRotatoria3D(450, 290, tam);
  dibujarEsferaRotatoria3D(660, 290, tam);
  
  dibujarEsferaRotatoria3D(530, 350, tam);
  dibujarEsferaRotatoria3D(770, 350, tam); 
}

void dibujarEsferaRotatoria3D(float x, float y, float tam) {
  pushMatrix();
  translate(x, y);
  rotate(angulo);
  
  noStroke();
  for (float d = tam; d > 0; d -= 2) {
    float inter = map(d, 0, tam, 1, 0);
    float r = lerp(245, 160, inter); 
    float g = lerp(210, 120, inter);
    float b = lerp(175, 85,  inter);
    fill(r, g, b);
    ellipse((tam-d)*0.15, -(tam-d)*0.15, d, d);
  }
  popMatrix();
}

void drawLineasSuperiores() {
  strokeWeight(5);
  float tam = calcularTamano(70);

  for (int y = 0; y < height; y += 15) {
    
    stroke(0, 230, 70);
    cortarLineaSobreEsfera(480, 70, tam, y);
    cortarLineaSobreEsfera(660, 150, tam, y);
    cortarLineaSobreEsfera(530, 350, tam, y);

    stroke(255, 40, 40);
    cortarLineaSobreEsfera(605, 70, tam, y + 5);
    cortarLineaSobreEsfera(785, 215, tam, y + 5);
    cortarLineaSobreEsfera(450, 290, tam, y + 5);
    cortarLineaSobreEsfera(660, 290, tam, y + 5);

    stroke(0, 100, 255);
    cortarLineaSobreEsfera(750, 70, tam, y + 10);
    cortarLineaSobreEsfera(415, 150, tam, y + 10);
    cortarLineaSobreEsfera(560, 215, tam, y + 10);
    cortarLineaSobreEsfera(770, 350, tam, y + 10);
  }
}

void cortarLineaSobreEsfera(float cx, float cy, float tam, float ly) {
  float radio = tam / 2;
  float inicioX = cx - radio;
  float finX = cx + radio;
  float primerX = -1;
  float ultimoX = -1;
  
  for (float testX = inicioX; testX <= finX; testX++) {
    if (dist(cx, cy, testX, ly) <= radio) {
      if (primerX == -1) { primerX = testX; }
      ultimoX = testX; 
    }
  }
  
  if (primerX != -1) {
    line(primerX, ly, ultimoX, ly);
  }
}

float calcularTamano(float base) {
  float t = map(mouseX, 0, width, base - 20, base + 20);
  return constrain(t, 45, 95); 
}

void mousePressed() {
  factorRandom = random(-5, 5); 
}

void keyPressed() {
  if (key == 'm') { mostrar = !mostrar; }
  if (key == 'r') { reiniciar(); }
}

void reiniciar() {
  angulo = 0;
  mostrar = true;
  factorRandom = 0;
}
