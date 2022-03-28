float min_var_ang = 0.5;
float max_var_ang = 20;

class Caminante {
  PGraphics w;   // caminantes
  PImage cw;     // textura caminantes

  float x, y, r;
  int t,d;
  float vel;
  float dir;
  color c;
  float a_var;
  int cont;
  int limite;
  int tiempo;
  String estado;

  Caminante() {

    x =random(0, width);
    y = random(0, height);
    t = 1;
    vel =1;
    dir= random(0, 360);
    r = height * 0.45;
    a_var = radians (random ( min_var_ang, max_var_ang));
    estado="recta";

    cw = loadImage("textura_linea.png");
    w = createGraphics(500, 600);
  }



  void dibujar() {

    w.beginDraw();
    w.pushStyle();
    w.noStroke();
    w.fill(#F7A7EF);
    w.ellipse(x, y, t, t);
    w.popStyle();
    w.endDraw();
    cw.mask(w);

    image(cw, 0, 0);
    image(w, 0, 0);
  }

  void asignarColor( color nuevoColor ) {
    c = nuevoColor;
  }

  void mover() {
    dir+=random(-10, 10);
    x= x+vel*cos(radians(dir+a_var));
    y= y+vel*sin(radians(dir+a_var));
  }




  void actualizar() {
    println(estado);
    println("contador:" +cont);

    //DIAGRAMA DE ESTADOS

    if ( estado.equals( "recta" ) ) {
      a_var = 0;
      mover();
      if ( cont>=30 ) {
        estado = "curva";
        limite = int( random( 30, 90 ) );
        cont = 0;
      }
    } else if ( estado.equals( "curva" ) ) {
      a_var = radians(3);
      mover();
      if ( cont>=limite ) {
        estado = "recta";
        cont = 0;
      }
    } 
    cont++;
  }




  void cambiarDir() {

    //detecta cuando no toca los bordes//
    if (x<=width-50 && x >=50 && y<=height-50 && y >=50) {
      //angulo trazo// 
      dir+=random(-10, 10);
      vel=1;
    }
    else {
      //se mueve en un angulo 0//
      dir=random(0);
      vel=random(1);
    }
  }


  void rebotes() {
    println(dir);
    //rebote derecha//
    if (x>=width) {
      dir=random(130, 180);
    }
    //rebote izquierda//
    if (x<=0) {
      dir=random(0, 50);
    }
    //rebote arriba//
    if (y<=0) {
      dir=random(40, 90);
    }
    //rebote abajo//
    if (y>=height) {
      dir=random(220, 270);
    }
  }
}
