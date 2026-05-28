float angle = 0;

void setup(){
  size(600,600, P3D);
}

void draw() {
  background(0);
  lights();
  noStroke();
  
  pushMatrix();
  translate(width/2, height/2, 0);
  fill(0,0,255);
  sphere(80);
  
  rotate(angle); 
  translate(200, 0, 0);    
  fill(150);
  sphere(30);
  
  angle += 0.02;
  popMatrix();
}
