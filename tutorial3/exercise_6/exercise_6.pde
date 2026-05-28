void setup() {
  size(400,400);
  //noLoop();
}

void draw() {
  background(0);
  int g = 100;
  noStroke();
  for (int i=0; i<100; i++){
    float x = random(50,350);
    float y = random(50,350);
    float r = random(5,50);
    
    fill(g);
    circle(x,y,r);
    
    g++;
    if (g==201)
      g = 100;
  }
}
