/**
Earth, Moon and Stars
*/
import shapes3d.utils.*;
import shapes3d.*;
import peasy.*;

PeasyCam cam;
Ellipsoid earth, moon, stars, sun;
PImage earthImg, moonImg, starsImg, sunImg;
PGraphics pg;

float earthAngle = 0;
float moonAngle = 0;

void setup(){
  size(1000,1000, P3D);
  pg = createGraphics(1000, 1000, P3D);  
  cam = new PeasyCam(this, pg, 800);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(2000);

  // Create the sun
  sun = new Ellipsoid(150, 50, 50);
  sunImg = loadImage("data/sun.jpg");
  sun.texture(sunImg);
  sun.moveTo(new PVector(0, 0, 0));
  sun.drawMode(Shape3D.TEXTURE);

  // Create the earth
  earth = new Ellipsoid(40, 20, 35);
  earthImg = loadImage("data/earth.jpg");
  earth.texture(earthImg);
  earth.moveTo(0, 0, 400);
  earth.drawMode(Shape3D.TEXTURE);

  // Create the moon
  moon = new Ellipsoid(10, 12, 15);
  moonImg = loadImage("data/moon.jpg");
  moon.texture(moonImg);
  moon.moveTo(0, 0, 500);
  moon.drawMode(Shape3D.TEXTURE);

  // Create the star background
  stars = new Ellipsoid(3000, 50, 50);
  starsImg = loadImage("data/stars01.jpg");
  stars.texture(starsImg);
  stars.drawMode(Shape3D.TEXTURE);
}

void draw(){
  pg.beginDraw();

  earthAngle += radians(0.3);   // earth orbits sun
  moonAngle += radians(2);      // moon orbits earth

  float earthX = sin(earthAngle) * 400;
  float earthZ = cos(earthAngle) * 400;
  earth.moveTo(earthX, 0, earthZ);

  float moonX = earthX + sin(moonAngle) * 100;
  float moonZ = earthZ + cos(moonAngle) * 100;
  moon.moveTo(moonX, 0, moonZ);

  earth.rotateBy(0, radians(1.5), 0);
  moon.rotateBy(0, radians(0.5), 0);
  stars.rotateBy(0, 0, radians(0.05));

  background(40);
  ambientLight(80, 80, 80);
  directionalLight(255, 255, 255, -150, 150, -80);

  sun.draw(pg);
  earth.draw(pg);
  moon.draw(pg);

  // reset lights for stars
  noLights();
  ambientLight(180, 180, 180);
  stars.draw(pg);

  pg.endDraw();
  cam.getState().apply(pg); 
  image(pg, 0, 0);
}
