void setup() {
  size(400,400);
}

void draw() {
  beginShape();
  vertex(150,200);
  bezierVertex(160,140,240,140,250,200);
  endShape();
  //vertex(155,190);
  beginShape();
  vertex(150,290);
  bezierVertex(130,250,160,300,170,290);
  endShape();
}
