void setup() {
  size(400,400); 
}

void draw() {
  
  // original 1st rect position
  // rect 1
  rectMode(CENTER);
  pushMatrix();
  translate(50, 50);
  fill(255,0,0); // red
  rect(1,1,80,40);
  
  // after reposition
  pushMatrix();
  translate(50, 0);
  rotate(PI/4);
  // rect 1
  fill(255,0,0); // red
  rect(1,1,80,40);
  popMatrix();
  
  popMatrix();
  
  // original 2nd rect position
  // rect 2
  rectMode(CORNER);
  pushMatrix();
  translate(200,200);
  fill(0,255,0); // green
  rect(1,1,80,40);
  
  // after reposition
  pushMatrix();
  translate(50, 0);
  rotate(PI/4);
  // rect 2
  fill(0,255,0); // green
  rect(1,1,80,40);
  popMatrix();
  
  //translate(10, 10);
  //pushMatrix();
  //rotate(PI/2);
  //// rect 3
  //fill(0,0,255); // blue
  //rect(1,1,80,40);
  //popMatrix();
  
  popMatrix();
  
  //pushMatrix();
  //rotate(PI/16);
  //// rect 4
  //fill(175); // gray
  //rect(1,1,80,40);
  //popMatrix();
  
}
