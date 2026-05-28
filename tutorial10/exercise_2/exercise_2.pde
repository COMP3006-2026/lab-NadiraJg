import shapes3d.utils.*;
import shapes3d.*;
import peasy.*;

PeasyCam cam;
PGraphics pg;

Car[] cars = new Car[5];

void setup() {
  size(1000, 800, P3D);
  pg = createGraphics(1000, 800, P3D);
  cam = new PeasyCam(this, pg, 800);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(3000);

  for (int i = 0; i < 5; i++) 
    cars[i] = new Car( int(random(0,1000)), int(random(0,1000)), int(random(0,300)), random(0.1,2.0), 
              color(random(0,256), random(0,256), random(0,256)), color(random(0,256), random(0,256), random(0,256))); 
}

void draw() {
  pg.beginDraw();
  pg.background(40);

  for (int i = 0; i < 5; i++) {
    cars[i].drawCar();
  }

  pg.endDraw();
  cam.getState().apply(pg);
  image(pg, 0, 0);
}


class Car {
  Box[] myBox = new Box[2];
  Ellipsoid[] myTire = new Ellipsoid[4];

  int cx, cy, cz;
  float s;         

  Car(int x, int y, int z, float scale, color bodyCol, color roofCol) {
    cx = x;
    cy = y;
    cz = z;
    s  = scale;

    // Main body
    myBox[0] = new Box(186*s, 50*s, 70*s);
    myBox[0].fill(bodyCol);
    myBox[0].drawMode(Shape3D.ALL);
    myBox[0].moveTo(cx + 20*s, cy, cz);

    myBox[1] = new Box(100*s, 38*s, 70*s);
    myBox[1].fill(roofCol);
    myBox[1].drawMode(Shape3D.SOLID);
    myBox[1].moveTo(cx + 42.5*s, cy - 43.5*s, cz);

    // Tires
    for (int i = 0; i < 4; i++) {
      myTire[i] = new Ellipsoid(int(10*s), int(10*s), int(10*s));
      myTire[i].fill(color(30, 30, 30));
      myTire[i].drawMode(Shape3D.SOLID);
      myTire[i].rotateTo(radians(90), 0, 0);
    }
    myTire[0].moveTo(cx - 63*s, cy + 30*s, cz + 35*s); 
    myTire[1].moveTo(cx - 63*s, cy + 30*s, cz - 35*s);
    myTire[2].moveTo(cx + 100*s, cy + 30*s, cz + 35*s); 
    myTire[3].moveTo(cx + 100*s, cy + 30*s, cz - 35*s); 
  }

  void drawCar() {
    myBox[0].draw(pg);
    myBox[1].draw(pg);

    for (int i = 0; i < 4; i++) {
      myTire[i].draw(pg);
    }

    pg.rectMode(CENTER);

    pg.pushMatrix();
    pg.translate(cx - 25*s, cy - 45*s, cz);
    pg.rotateY(radians(90));
    pg.rotateX(radians(135));
    pg.rect(0, 0, 70*s, 50*s);
    pg.popMatrix();

    pg.pushMatrix();
    pg.translate(cx + 93*s, cy - 43.5*s, cz);
    pg.rotateY(radians(90));
    pg.rect(0, 0, 70*s, 40*s);
    pg.popMatrix();

    pg.pushMatrix();
    pg.translate(cx + 42.5*s, cy - 63*s, cz);
    pg.rotateX(radians(90));
    pg.rect(0, 0, 100*s, 70*s);
    pg.popMatrix();
  }
}
