int xr=90, xe=110;
int yr=100, ye=100;
float rectW=random(10,40), rectH=random(10,40), ellW=random(10,40), ellH=random(10,40);
boolean rectangle = true;

void setup() {
  size(200,200); 
}

void draw() {
  background(255);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  fill(0);
  randomSeed(0);
  rect(xr,yr,rectW,rectH);
  fill(255);
  randomSeed(1);
  ellipse(xe,ye,ellW,ellH);
}

void mouseClicked() {
  if (mouseX>xr-(rectW/2) && mouseX<xr+(rectW/2) && mouseY>yr-(rectH/2) && mouseY<yr+(rectH/2))
    rectangle = true;
  else if (mouseX>xe-(ellW/2) && mouseX<xe+(ellW/2) && mouseY>ye-(ellH/2) && mouseY<ye+(ellH/2))
    rectangle = false;
}

void mouseDragged() {
  if (rectangle == true) {
    xr = mouseX;
    yr = mouseY;
  }
  else if (rectangle == false) {
    xe = mouseX;
    ye = mouseY;
  }
}
