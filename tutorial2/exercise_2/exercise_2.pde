float gray;

void setup() {
  size(100,100);
}

void draw() {
  noStroke();
  for (int i=0; i<width; i+=5) {
    for (int j=0; j<height; j+=5) {
      gray = random(0,255);
      fill(gray);
      rect(i,j,5,5);
    }
  }
}
