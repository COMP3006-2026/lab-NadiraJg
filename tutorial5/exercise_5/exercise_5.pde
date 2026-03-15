float x, y;

void setup() {
  size(400, 400);
  x = 200;
  y = 200;
}

void draw() {
  background(255);
  fill(0,200,255);
  circle(x, y, 5);
  noFill();
  strokeWeight(2);
  ellipse(x, y, 300, 300);
    
  float secX = x + 115 * cos(radians(second()*6-90));
  float secY = y + 115 * sin(radians(second()*6-90));
  float minX = x + 100 * cos(radians(minute()*6-90));
  float minY = y + 100 * sin(radians(minute()*6-90));
  float hourX = x + 65 * cos(radians(hour()*30-90+minute()*0.5));
  float hourY = y + 65 * sin(radians(hour()*30-90+minute()*0.5));
  
  line(x, y, secX, secY);
  strokeWeight(4);
  line(x, y, minX, minY);
  line(x, y, hourX, hourY);
  
  textSize(20);
  textAlign(CENTER,CENTER);
  fill(0);
  for (int i = 1; i <= 12; i++) {
    float numX = x + 130 * cos(radians(i*30-90));
    float numY = y + 130 * sin(radians(i*30-90));
    text(i, numX, numY);
  }
}
