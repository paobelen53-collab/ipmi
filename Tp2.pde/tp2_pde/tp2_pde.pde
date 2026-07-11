float textoX = -300;   
float textoY = 480; 
int pantalla = 0;
int estadoTexto = 0;
int tiempoEspera = 4000;
int marcaTiempo;
PImage img1, img2, img3, img4, img5, img6, img7;
PFont fuenteTitulo;
PFont fuenteCuerpo;

void setup() {
  size(640, 480);
  
  img1 = loadImage("grupo.jpeg");
  img2 = loadImage("mafalda.jpg");
  img3 = loadImage("manolito.jpeg");
  img4 = loadImage("susanita.jpeg");
  img5 = loadImage("libertad.jpeg");
  img6 = loadImage("felipe.jpeg");
  img7 = loadImage("miguelito.jpeg");
  
  fuenteTitulo = createFont("Georgia-Bold", 28);
  fuenteCuerpo = createFont("SansSerif", 18);
  
  textAlign(CENTER, TOP);
  textSize(18); 
}

void draw() {
  background(240, 140, 140);
  
    switch(pantalla) {
    case 0: dibujarInicio(); break;
    case 1: dibujarContenido(img1, "Este es un universo creativo cargado de historias, motivos y personajes bien definidos que construyen el entorno social de Mafalda. Siempre con humor, cada personaje aporta una mirada y un razonamiento diferente a cuestiones cotidianas o fantásticas, con las creencias que surgen de los niños, y con las que se les imponen. "); break; 
    case 2: dibujarContenido(img2, "Mafalda: la protagonista, una niña inteligente, curiosa y profundamente preocupada por los problemas del mundo. Desde pequeña cuestiona las injusticias sociales, la política, y las contradicciones de los adultos. Es una pacifista declarada, y su repudio hacia la sopa simboliza su rechazo al conformismo."); break;
    case 3: dibujarContenido(img3, "Manolito: un niño que trabaja en el almacén de su padre, inmigrante gallego. Su mentalidad materialista lo lleva a pensar en lo mejor para el negocio familiar. Sus comentarios reflejan una mentalidad altamente comercial."); break;
    case 4: dibujarContenido(img4, "Susanita: Susanita tiene una visión muy tradicionalista y conservadora. Sueña con casarse y tener hijitos, y muchas veces expresa pensamientos egoístas o superficiales, lo que genera frecuentes discusiones con Mafalda y Manolito."); break;
    case 5: dibujarContenido(img5, "Libertad: el personaje más pequeño. Libertad es una niña que le gusta la vida y la gente simple, simple siempre bajo su criterio."); break;
    case 6: dibujarContenido(img6, "Felipe: un niño soñador e imaginativo, pero también con muchas dudas y angustia por la realidad, y las responsabilidades."); break;
    case 7: dibujarContenido(img7, "Miguelito: inocente e ingenuo, siempre perdido en sus propias reflexiones y a veces desconectado de la realidad. Miguelito es capaz de ver las cosas desde el otro lado."); break;
    case 8: dibujarFinal(); break;
  }
}

void dibujarContenido(PImage img, String mensaje) {
  if (img != null) {
    imageMode(CENTER);
    image(img, width/2, height/2 - 110, 230, 230);
  }
  textFont(fuenteCuerpo);
  fill(0);
  rectMode(CENTER);
  text(mensaje, textoX, textoY, 550, 250); 

  if (estadoTexto == 0) { 
    textoX += 15;
    if (textoX >= width/2) {
      textoX = width/2;
      estadoTexto = 1;
      marcaTiempo = millis();
    }
  } 
  else if (estadoTexto == 1) { 
    if (millis() - marcaTiempo > tiempoEspera) {
      estadoTexto = 2;
    }
  } 
  else if (estadoTexto == 2) { 
    textoY += 10; 
    if (textoY > height + 200) {
      pantalla++;
      reiniciarTexto();
    }
  }
}

void reiniciarTexto() {
  textoX = -300;
  textoY = 380; 
  estadoTexto = 0;
}

void dibujarInicio() {
  fill(0);
  textFont(fuenteTitulo);
  textSize(24);
  text("EL UNIVERSO DE MAFALDA", width/2, height/2 - 20);
  textFont(fuenteCuerpo);
  textSize(18);
  text("Click para conocer más", width/2, height/2 + 40);
}

void dibujarFinal() {
  fill(0);
  textFont(fuenteTitulo);
  textSize(24);
  text("FIN DE LA PRESENTACIÓN", width/2, 150);
  fill(255, 0, 0);
  rect(width/2, 300, 200, 50);
  fill(255);
  textFont(fuenteCuerpo);
  textSize(20);
  text("REINICIAR", width/2, 290);
}

void mousePressed() {
  if (pantalla == 0) {
    pantalla = 1;
  } 
  else if (pantalla == 8 && (mouseX > 220 && mouseX < 420) && (mouseY > 275 && mouseY < 325)) {
    pantalla = 0;
    reiniciarTexto();
  }
}
