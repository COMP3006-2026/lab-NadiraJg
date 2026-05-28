import shapes3d.utils.*;
import shapes3d.*;
import peasy.*;

Box[] myBox = new Box[2];
Ellipsoid[] myTire = new Ellipsoid[4];
PeasyCam cam;

PGraphics pg;

void setup(){
  size(1000,800, P3D);  
  pg = createGraphics(1000, 800, P3D);
  cam = new PeasyCam(this, pg, 800);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(2000);
  
  myBox[0] = new Box(186, 50, 70);
  myBox[0].fill(color(255,0,0));
  myBox[0].drawMode(Shape3D.ALL);
  myBox[0].moveTo(20, 0, 0);
  
  myBox[1] = new Box(100, 38, 70);
  myBox[1].fill(color(0,150,255));
  myBox[1].drawMode(Shape3D.SOLID);
  myBox[1].moveTo(42.5, -43.5, 0);
  
  // tires
  for(int i = 0; i < 4; i++){
    myTire[i] = new Ellipsoid (10, 10, 10);
    myTire[i].fill(color(30, 30, 30));
    myTire[i].drawMode(Shape3D.SOLID);
    myTire[i].rotateTo(radians(90), 0, 0);
  }
  
  myTire[0].moveTo(-63, 30, 35);  // front left
  myTire[1].moveTo(-63, 30, -35);  // front right (mirrored in Z)
  myTire[2].moveTo(100, 30, 35);  // rear left
  myTire[3].moveTo(100, 30, -35);  // rear right (mirrored in Z)
}
void draw(){
  pg.beginDraw();
    
  background(40);
 
  myBox[0].draw(pg);
  myBox[1].draw(pg);
  
  for (int i=0; i<4; i++) {
    myTire[i].draw(pg);
  }
  
  // the main body
  pg.rectMode(CENTER);
  
  // windshield
  pg.pushMatrix();
  pg.translate(-25,-45,0);
  pg.rotateY(radians(90));
  pg.rotateX(radians(135));
  pg.rect(0,0,70,50);
  pg.popMatrix();
  
  // rear window
  pg.pushMatrix();
  pg.translate(93,-43.5,0);
  pg.rotateY(radians(90));
  pg.rect(0,0,70,40);
  pg.popMatrix();
  
  // the roof
  pg.pushMatrix();
  pg.translate(42.5,-63,0);
  pg.rotateX(radians(90));
  pg.rect(0,0,100,70);
  pg.popMatrix();
    
  pg.endDraw(); 
  cam.getState().apply(pg); 
  image(pg, 0, 0);
}
