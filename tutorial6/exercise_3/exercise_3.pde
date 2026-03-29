PImage img3;

int rectW=0, rectH=0, x=0, y=0, cx=0, cy=0;

boolean copy = false, paste = false;

void setup() {
  size(400, 400);
  img3 = loadImage("myimage3.jpg");
  img3.resize(400,400);
}

void draw() {
  image(img3, 0, 0);
  noFill();
  stroke(255);
  if (!copy)
    rect(x, y, rectW, rectH);
  else {
    if (!paste) {
      cx = mouseX;
      cy = mouseY;
    }
    copy(img3, x, y, rectW, rectH, cx, cy, rectW, rectH);
  }
}

void mousePressed() {
  if (!copy) {
    x = mouseX;
    y = mouseY;
  } 
}

void mouseDragged() {
  rectW = mouseX - x;
  rectH = mouseY - y;
}

void mouseReleased() {
  copy = true;
}

void mouseClicked() {
  paste = true;
}
