void setup() {
  size(400,400); 
}

void draw() {
  
  // original position 0,0
  
  pushMatrix();
  
  translate(50, 50);
  // rect 1
  fill(255,0,0); // red
  rect(1,1,80,40);
  
  translate(20, 20);
  // rect 2
  fill(0,255,0); // green
  rect(1,1,80,40);
  
  translate(10, 10);
  // rect 3
  fill(0,0,255); // blue
  rect(1,1,80,40);
  
  popMatrix();
  
  // rect 4
  fill(175); // gray
  rect(1,1,80,40);
  
}
