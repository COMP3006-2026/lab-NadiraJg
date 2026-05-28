void setup() {
  size(400,400);
}

void draw() {
  // set starting point at 200,200
  int startX = 200;
  int startY = 200;
  smooth();
  strokeWeight(0);
  int prevX1 = 0, prevX2 = 0, prevY = startY-1;
  int maxOffset = width / 2;
  
  for (int i=0; i<=maxOffset; i++) {
    int curX1 = i;
    int curX2 = i*(-1);
    float normalizedX = (float)i / maxOffset;
    float f = 1 - pow(normalizedX, 4);
    int curY = startY - int(f * maxOffset);
    line(startX+prevX1, prevY, startX+curX1, curY);
    line(startX+prevX2, prevY, startX+curX2, curY);
    prevX1 = curX1;
    prevX2 = curX2;
    prevY = curY;
  }
}
