int xr=90, xe=110;
int yr=100, ye=100;
boolean rectangle = true;
void setup() {
  size(200,200); 
}

void draw() {
  background(255);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  rect(xr,yr,10,10);
  ellipse(xe,ye,10,10);
    
  if (keyPressed) {
    if (key == '1')
      rectangle = true;
    if (key == '2')
      rectangle = false;
    if (keyCode == LEFT) {
      if (rectangle)
        xr -= 5;
      else
        xe -= 5;
    }
    if (keyCode == RIGHT) {
      if (rectangle)
        xr += 5;
      else
        xe += 5;
    }
    if (keyCode == UP) {
      if (rectangle)
        yr -= 5;
      else
        ye -= 5;
    }
    if (keyCode == DOWN) {
      if (rectangle)
        yr += 5;
      else
        ye += 5;
    }
    
    if (xe<10)
      xe = 10;
    if (xe>width-10)
      xe = width-10;
    if (ye<10)
      ye = 10;
    if (ye>height-10)
      ye = height-10;
    
    if (xr<10)
      xr = 10;
    if (xr>width-10)
      xr = width-10;
    if (yr<10)
      yr = 10;
    if (yr>height-10)
      yr = height-10;
  }

}
