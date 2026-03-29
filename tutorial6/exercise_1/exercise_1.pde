void setup() {
  size(300,300);
}

void draw() {
  PImage img = loadImage("myimage1.jpg");
  PImage img2 = loadImage("myimage2.jpg");
  image(img, 0, 0, width, height);
  copy(img2, 120, 120, 115, 118, mouseX, mouseY, width/3, height/3); 
}
