//no link de tengo video, pero igualmente les queria dejar el codigo,
// Se que por mas que tuviera el video, no supe encontrar la manera de que las elipses verdes se vean y eso ya me resta mucho.
PImage imgRef;
float escala = 1; 
float angulo = 0; 
int desplazamiento = 0; 
boolean mostrar = true; 

void setup() {
  size(800, 400);
  imgRef= loadImage("21.jpg");
  }

void draw() {

  background(255);
   image(imgRef, 0,0, 400, 400);
   
if(mostrar){ 
drawGreenEllipses(); 
drawGreenLines(); 
drawRedEllipses(); 
drawRedLines(); 
drawBlueEllipses(); 
drawBlueLines(); 
}else{ 
fill(0); 
text("ELIPSES OCULTAS",500,200); 
} pushMatrix(); 

translate(600,200); 
rotate(angulo); 
dibujarElipse(-130,-125,70,90); 
popMatrix(); 
} 
void mousePressed() { 
desplazamiento = int(random(-20,20)); } 
float distanciaCentro() { 
return dist(mouseX,mouseY,600,200); 
}
float calcularTamano(float base){
  return map(mouseX,0,width,base-10,base+20);
}

void keyPressed(){

  if(key=='a'){
    angulo+=0.2;
  }

  if(key=='m'){
    mostrar=!mostrar;
  }

  if(key=='r'){
    reiniciar();
  }

}

// Presente las lineas y elipses por colores "en capas" como entendi segun la recomendacion de profe en la clase por meet
void drawGreenLines() { 
stroke(0, 255, 0); 
strokeWeight(4); 
for (int y = 3; y < 400; 
y += 12) { line(400, y, 800, y); 
} 
} 
void drawRedLines() { 
stroke(255, 0, 0); 
strokeWeight(4); 
for (int y = 7; y < 400; y += 12) { 
line(400, y, 800, y); 
} 
} 
void drawBlueLines() { 
stroke(0, 0, 255); 
strokeWeight(4); 
for (int y = 11; y < 400; y += 12) { 
line(400, y, 800, y); 
}
} 

 void drawGreenEllipses() {

  float tam = calcularTamano(70);

  noStroke();
  fill(210,180,140);

  dibujarElipse(470,75,tam,tam+20);
  dibujarElipse(670,150,tam,tam+20);
  dibujarElipse(430,350,tam,tam+20);
}
 
 void drawRedEllipses() {

  float tam = calcularTamano(70);

  noStroke();
  fill(210,180,140);

  dibujarElipse(600,70,tam,tam+20);
  dibujarElipse(440,250,tam,tam+20);
  dibujarElipse(680,285,tam,tam+20);
  dibujarElipse(790,180,tam,tam+20);
}

void drawBlueEllipses() {

  float tam = calcularTamano(70);

  noStroke();
  fill(210,180,140);

  dibujarElipse(740,60,tam,tam+20);
  dibujarElipse(440,150,tam,tam+20);
  dibujarElipse(540,220,tam,tam+20);
  dibujarElipse(760,340,tam,tam+20);
}

void dibujarElipse(float x, float y, float w, float h) {
  noStroke();
  fill(210,180,140);
  ellipse(x,y,w,h);
}

void fondoPuntos() { 
stroke(220); 
for(int x=400;x<800;x+=20){ 
for(int y=0;y<400;y+=20){ 
point(x,y); 
} 
} 
} 
void reiniciar(){ 
escala=1; 
angulo=0; 
desplazamiento=0; 
mostrar=true; 
}
