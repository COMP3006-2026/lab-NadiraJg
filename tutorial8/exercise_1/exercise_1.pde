void setup() {
  size(400, 400, P3D);
  fill(204);
}

void draw() {
  background(0);
  translate(width/2, height/2, -width);
  rotateX(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));
  noStroke();
  circle(0, 0, 400);
  stroke(255);
  line(0, 0, -200, 0, 0, 200);
 
}
  
