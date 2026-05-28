import shapes3d.utils.*;
import shapes3d.*;

Ellipsoid[] mySphere = new Ellipsoid[10];
Box[] myBox = new Box[10];

int x, y;
float[] prevX = new float[20];
float[] prevY = new float[20];
float boxX, boxY, sphereX, sphereY;
boolean valid;

PGraphics pg;

void setup(){
  size(1000,800, P3D);  
  pg = createGraphics(1000, 800, P3D);
  for (int i = 0; i < 10; i++) {
    // create 10 random boxes and spheres
    
    float rand = random(25, 76);
    float red = random(0, 256);
    float green = random(0, 256);
    float blue = random(0, 256);
    
    valid = false;
    while(!valid) {
      boxX = random(100, 901);
      boxY = random(100, 701);
      
      valid = true;
      for (int j = 0; j < 20; j++) {
        if (boxX == prevX[j] && boxY == prevY[j])
          valid = false;
      }
    }
    
    valid = false;
    while(!valid) {
      sphereX = random(100, 901);
      sphereY = random(100, 701);
      
      valid = true;
      for (int j = 0; j < 20; j++) {
        if (sphereX == prevX[j] && sphereY == prevY[j])
          valid = false;
      }
    }
    
    myBox[i] = new Box(rand, rand, rand);
    myBox[i].fill(color(red, green, blue));
    myBox[i].drawMode(Shape3D.ALL);
    myBox[i].moveTo(boxX, boxY, 0);
    
    mySphere[i] = new Ellipsoid(rand, rand, rand, 20, 30);
    mySphere[i].fill(color(red, green, blue));
    mySphere[i].drawMode(Shape3D.ALL);
    mySphere[i].moveTo(sphereX, sphereY, 0);
  }
  
  for (int i = 0; i < 20; i+=2) {
    prevX[i] = boxX;
    prevY[i] = boxY;
    prevX[i+1] = sphereX;
    prevY[i+1] = sphereY;
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
