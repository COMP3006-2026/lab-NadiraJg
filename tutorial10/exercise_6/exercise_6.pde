import shapes3d.utils.*;
import shapes3d.*;
import peasy.*;

PeasyCam cam;
PGraphics pg;

Car[] cars = new Car[5];
float time = 0;

void setup() {
  size(1000, 800, P3D);
  pg = createGraphics(1000, 800, P3D);
  cam = new PeasyCam(this, pg, 800);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(3000);

  for (int i = 0; i < 5; i++) 
    cars[i] = new Car(int(random(0, 1000)), int(random(0, 1000)), int(random(0, 300)), random(0.1, 2.0), 
              color(random(0, 256), random(0, 256), random(0, 256)), color(random(0, 256), random(0, 256), random(0, 256))); 
}

void draw() {
  pg.beginDraw();
  pg.background(40);

  for (int i = 0; i < 5; i++) {
    cars[i].updateTransformation(time);
    cars[i].drawCar();
  }

  pg.endDraw();
  cam.getState().apply(pg);
  image(pg, 0, 0);
  
  time += 0.01; // Increment time for smooth animations
}


class Car {
  Box[] myBox = new Box[2];
  Ellipsoid[] myTire = new Ellipsoid[4];

  int startX, startY, startZ;
  int cx, cy, cz;
  float s;
  float currentScale;
  float transparency = 255;
  color bodyCol, roofCol;

  Car(int x, int y, int z, float scale, color bCol, color rCol) {
    startX = x;
    startY = y;
    startZ = z;
    cx = x;
    cy = y;
    cz = z;
    s = scale;
    currentScale = s;
    bodyCol = bCol;
    roofCol = rCol;

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

  void updateTransformation(float t) {
    cx = startX + int(cos(t) * 200);
    cy = startY + int(sin(t) * 150);
    cz = startZ;

    if (cars.length > 1) {
      float t2 = t * 2; 
      int nextCX = startX + int(t2 * 100);
      int nextCY = startY + int(sin(t2) * 150);
      int nextCZ = startZ + int(cos(t2) * 100);
      
      cars[1].cx = nextCX;
      cars[1].cy = nextCY;
      cars[1].cz = nextCZ;
      cars[1].updateCarPositions();
      
      for (int i = 0; i < 2; i++) {
        cars[1].myBox[i].rotateTo(0, t2, 0);
      }
      for (int i = 0; i < 4; i++) {
        cars[1].myTire[i].rotateTo(radians(90), t2, 0);
      }
    }

    if (cars.length > 2) {
      float t3 = t * 1.5;
      int nextCX = startX + int(sin(t3) * 200);
      int nextCY = startY + int(cos(t3) * 150);
      int nextCZ = startZ + int(sin(t3 * 0.5) * 100);
      
      cars[2].cx = nextCX;
      cars[2].cy = nextCY;
      cars[2].cz = nextCZ;
      
      cars[2].currentScale = s + (sin(t3) + 1) * 0.5 * s; 
      cars[2].updateCarScale();
      cars[2].updateCarPositions();
    }

    if (cars.length > 3) {
      float t4 = t * 1.2;
      int nextCX = startX + int(t4 * 80);
      int nextCY = startY + int(sin(t4) * 200);
      int nextCZ = startZ + int(cos(t4) * 100);
      
      cars[3].cx = nextCX;
      cars[3].cy = nextCY;
      cars[3].cz = nextCZ;
      cars[3].updateCarPositions();
      
      cars[3].transparency = 255 * abs(sin(t4));
    }

    if (cars.length > 4) {
      float t5 = t * 0.8;
      int nextCX = startX + int(cos(t5) * 250);
      int nextCY = startY + int(sin(t5) * 200);
      int nextCZ = startZ + int(sin(t5 * 2) * 150);
      
      cars[4].cx = nextCX;
      cars[4].cy = nextCY;
      cars[4].cz = nextCZ;
      cars[4].updateCarPositions();
    }

    if (cars.length > 0) {
      cars[0].updateCarPositions();
    }
  }

  void updateCarPositions() {
    myBox[0].moveTo(cx + 20*currentScale, cy, cz);
    myBox[1].moveTo(cx + 42.5*currentScale, cy - 43.5*currentScale, cz);

    myTire[0].moveTo(cx - 63*currentScale, cy + 30*currentScale, cz + 35*currentScale); 
    myTire[1].moveTo(cx - 63*currentScale, cy + 30*currentScale, cz - 35*currentScale);
    myTire[2].moveTo(cx + 100*currentScale, cy + 30*currentScale, cz + 35*currentScale); 
    myTire[3].moveTo(cx + 100*currentScale, cy + 30*currentScale, cz - 35*currentScale);
  }

  void updateCarScale() {
    myBox[0] = new Box(186*currentScale, 50*currentScale, 70*currentScale);
    myBox[0].drawMode(Shape3D.ALL);
    myBox[0].fill(bodyCol);

    myBox[1] = new Box(100*currentScale, 38*currentScale, 70*currentScale);
    myBox[1].drawMode(Shape3D.SOLID);
    myBox[1].fill(roofCol);

    for (int i = 0; i < 4; i++) {
      myTire[i] = new Ellipsoid(int(10*currentScale), int(10*currentScale), int(10*currentScale));
      myTire[i].fill(color(30, 30, 30));
      myTire[i].drawMode(Shape3D.SOLID);
      myTire[i].rotateTo(radians(90), 0, 0);
    }
  }

  void drawCar() {
    pg.pushMatrix();
    
    if (transparency < 255) {
      pg.fill(255, transparency);
      pg.stroke(255, transparency);
    }

    myBox[0].draw(pg);
    myBox[1].draw(pg);

    for (int i = 0; i < 4; i++) {
      myTire[i].draw(pg);
    }

    pg.rectMode(CENTER);

    pg.pushMatrix();
    pg.translate(cx - 25*currentScale, cy - 45*currentScale, cz);
    pg.rotateY(radians(90));
    pg.rotateX(radians(135));
    pg.rect(0, 0, 70*currentScale, 50*currentScale);
    pg.popMatrix();

    pg.pushMatrix();
    pg.translate(cx + 93*currentScale, cy - 43.5*currentScale, cz);
    pg.rotateY(radians(90));
    pg.rect(0, 0, 70*currentScale, 40*currentScale);
    pg.popMatrix();

    pg.pushMatrix();
    pg.translate(cx + 42.5*currentScale, cy - 63*currentScale, cz);
    pg.rotateX(radians(90));
    pg.rect(0, 0, 100*currentScale, 70*currentScale);
    pg.popMatrix();

    pg.popMatrix();
  }
}
