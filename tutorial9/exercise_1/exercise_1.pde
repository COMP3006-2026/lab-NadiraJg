import shapes3d.utils.*;
import shapes3d.*;

Ellipsoid[] mySphere = new Ellipsoid[10];
Box[] myBox = new Box[10];

int x, y;

PGraphics pg;

void setup(){
  size(1000,800, P3D);  
  pg = createGraphics(1000, 800, P3D);
  for (int i = 0; i < 10; i++) {
    // create 10 random boxes and spheres
    x = i%5 * 200;
    if (i >= 5)
      y = 200;
    else
      y = 0;
    
    float rand = random(25, 76);

    myBox[i] = new Box(rand, rand, rand);
    myBox[i].drawMode(Shape3D.WIRE);
    myBox[i].moveTo(100 + x, 100 + y, 0);
    
    mySphere[i] = new Ellipsoid(rand, rand, rand, 20, 30);
    mySphere[i].drawMode(Shape3D.WIRE);
    mySphere[i].moveTo(100 + x, 500 + y, 0);
  }
}
void draw(){
  pg.beginDraw();
  pg.background(40);

  for (int i = 0; i < 10; i++) {
    myBox[i].rotateBy(0, radians(0.8), 0);
    myBox[i].draw(pg);
    mySphere[i].rotateBy(0, radians(0.6), 0);
    mySphere[i].draw(pg);
  }

  pg.endDraw();
  image(pg, 0, 0);
}
