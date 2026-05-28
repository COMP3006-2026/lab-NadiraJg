PImage img;
PImage img2;

void setup() {
  size(300,300);
  img = loadImage("myimage1.jpg");
  img2 = loadImage("myimage2.jpg");
}

void draw() {
  image(img, 0, 0, width, height);
  copy(img2, 120, 120, 115, 118, mouseX, mouseY, width/3, height/3); 
}
