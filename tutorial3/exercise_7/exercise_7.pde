void setup() {
  size(600, 100);
}

void draw() {
  background(255);
  float v = 10;
  float inc = 0.01;
  noStroke();
  fill(0);
  noiseSeed(25);
  for (int i = 0; i < width; i += 10) {
    float n = noise(v) * 100.0;
    rect(i, 0.1 + n, 3, 50);
    circle(i+3/2, 10+n, 8);
    v = v + inc;
  }
}
