PImage miImagen;

void setup(){
  size(800,400);
  miImagen = loadImage("imagengriega.jpg");
}
void draw() {
  background(220,180,100);
  image(miImagen,0,0,400,400);
 fill(150);
 noStroke();
 ellipse(400,370,250,40);
 
 fill(120,90,50,80);
ellipse(430, 300, 250, 100);

fill(235);
stroke(200);
ellipse(520, 90, 50, 50);
noStroke();

fill(230);
rect(500,110,30,30);

fill(230);
ellipse(460,180,120,150);

fill(245);
ellipse(480,160,50,30);

fill(220);
ellipse(450,210,70,60);

stroke(230);
strokeWeight(12);
line(500, 140, 360, 100);
line(360, 100, 280, 80);

fill(240);
ellipse(260, 70, 60, 60);

noFill();
stroke(200);
strokeWeight(3);
ellipse(260, 70, 40, 40);
stroke(230);
strokeWeight(12);
line(440, 240, 400, 300);
line(400, 300, 370, 340);
noStroke();
fill(235);
ellipse(370, 345, 25, 25);
stroke(230);
strokeWeight(16);
line(450, 260, 430, 340);
line(430, 340, 410, 380);
noStroke();

fill(235);
ellipse(400, 385, 60, 20);

stroke(230);
strokeWeight(16);
line(500,260,560,320);
line(560,320,540,360);
noStroke();

fill(235);
ellipse(540,370,60,20);

fill(180,140,100,120);
ellipse(480,250,120,80);
stroke(200);
strokeWeight(2);
line(460,150,450,250);
  
}
  
