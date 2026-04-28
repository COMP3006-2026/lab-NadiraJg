int x = 400, y = 400, z;

void setup() {
  size(800,800,P3D); 
}

void draw() {
  noStroke();
  background(0);
  lights();
  if (keyPressed && keyCode == SHIFT)
    z-=3;
  fill(100,100,200);
  translate(x,y,z);
  sphere(200);
}

void mouseDragged() {
  x = mouseX;
  y = mouseY;
}
