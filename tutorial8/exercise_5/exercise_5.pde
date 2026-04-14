float angle = 0;
float startX, startY, moonX, moonY;
float pct = 0.0;      // percentage travele (0.0 to 1.0);
float step = 0.0;     // size of each step along the path
float shuttleSpeed = 0;
boolean arrived = false;

void setup(){
  size(600,600, P3D);
  startX = -200;
  startY = -80;
  moonX = 200;
  moonY = 0;
}

void draw() {
  background(0);
  lights();
  noStroke();
  
  if (!arrived) {
    step += 0.005;                            
    shuttleSpeed = sin(step * PI) * 0.005;    
    pct += shuttleSpeed;                          
  }
  
  if (pct >= 1.0) {
    pct = 1.0;
    arrived = true;
  }
  
  float shuttleX = lerp(startX, moonX, pct);
  float shuttleY = lerp(startY, moonY, pct);
  
  pushMatrix();
  translate(width/2, height/2, 0);
  fill(0,0,255);
  sphere(80);
  
  rotate(angle); 
  translate(moonX, moonY, 0);   
  fill(150);
  sphere(30);
  
  fill(255,0,0);
  translate(shuttleX, shuttleY, 0);
  box(10, 30, 10);
  popMatrix();
  
  angle += 0.02;
}
