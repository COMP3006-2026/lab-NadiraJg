void setup() {
  size(400,400);
}

void draw() {
  float angle = 0.0;
  float scaleVal = 20.0;
  float angleInc = PI/18.0;
  float offset = 200;
  int i=1;
  smooth();
  
  // blue wave
  for (int x=0; x<=400; x+=5) {
    float y = offset + sin(angle) * scaleVal;
    strokeWeight(i);
    stroke(0,0,255);
    point(x-10,y-10);
    stroke(0,255,255);
    point(x,y);
    stroke(200,255,255);
    point(x+10,y+10);
    angle+=angleInc;
    if (i==5)
      i = 1;
    else
      i++;
  }
}
