import peasy.*;
PeasyCam cam;

void setup() {
  size(400, 400, P3D);
  fill(204);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(800);
  cam.setMaximumDistance(2000);
}

void draw() {
  background(0);
  translate(width/2, height/2, -width);
  rotateX(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));
  noStroke();
  pentagon(0, 0, 200);
  stroke(255);
  line(0, 0, -200, 0, 0, 200);
 
}

void pentagon(float x, float y, float radius) {
  float angle = TWO_PI / 5;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
