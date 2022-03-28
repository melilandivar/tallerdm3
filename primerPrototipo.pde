float disperX, disperY, x, y;
Caminante c;

void setup() {
  size (500, 1000);
  background(0);

  colorMode(HSB);
  smooth();
  disperX=1*width;
  disperY=1*height;
  x=width/2;
  y=height/2;

  c = new Caminante();
}

void draw() {
  c.dibujar();
  c.mover();
  c.rebotes();
  if (mousePressed) {

    noStroke();
    fill(0, 9); //con esto se modifica la velocidad con la que va cambiando el fondo
    rect(0, 0, 1000, 1000);
    strokeWeight(1);
    stroke((250-pmouseX/4), mouseY/(500/255), sq(sq(pmouseX/(100/51)-sq(pmouseY/(100/51)))));
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

  noFill();
  strokeWeight(1);
  stroke(random(255));
  float dsprt=1.8;

  //calculates the parameters to the bezier
  float a=dispers(-width/8, width/8);
  float b=dispers(-height/8, height/8);
  float c=dsprt*dispers(-width/2, width/2);
  float d=dsprt*dispers(-height/2, height/2);
  float e=dsprt*dispers(-width/2, width/2);
  float f=dsprt*dispers(-height/2, height/2);



  bezier(a, b, c, d, e, f, a, b);
  translate(width/3, height/4);
  bezier(a, b, c, d, e, f, a, b);
  translate(width/2, height/2);
  bezier(a, b, c, d, e, f, a, b);
  translate(-width/2, height/3);
  bezier(a, b, c, d, e, f, a, b);
  translate(width/2, -height/7);
  bezier(a, b, c, d, e, f, a, b);
}


float dispers(float rangeF, float rangeT) {
  // calculates random normally distributed
  int iter=4;
  float disper=0;
  for (int i=0; i<iter; i++) {
    disper+=random(rangeF, rangeT);
  }
  return disper/iter;
}
