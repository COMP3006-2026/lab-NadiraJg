void setup() {
  size(400,400);
}

void draw() {
  // make a hat
  fill(255,170,200); // peach
  stroke(0);
  strokeWeight(1);
  beginShape();
  vertex(160,180);
  bezierVertex(30,235,370,235,240,180);
  endShape();
  beginShape();
  vertex(150,200);
  bezierVertex(160,140,240,140,250,200);
  endShape();
  
  // make the ribbon
  stroke(255,0,0);
  strokeWeight(2);
  beginShape();
  vertex(200,200);
  bezierVertex(150,210,150,160,215,210);
  endShape();
  beginShape();
  vertex(200,200);
  bezierVertex(250,210,250,160,185,210);
  endShape();
}
