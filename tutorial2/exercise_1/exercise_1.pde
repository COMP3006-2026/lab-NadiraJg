void setup() {
  size(200,200);
}

void draw() {
  noStroke();
  if (mouseX < width/3) {
    background(100); // gray
    fill(255,0,0); // red
    rect(0,0,width/3,height);
  } else if (mouseX > width - width/3) {
    background(100);
    fill(0,0,255); // blue
    rect(width-width/3, 0, width/3, height);
  } else {
    background(100);
    fill(0,255,0); // green
    rect(width/3, 0, width/3, height);
  }
}
