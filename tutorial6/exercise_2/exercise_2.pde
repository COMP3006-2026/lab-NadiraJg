PImage img;
void setup() {
  size(200, 200);
  noStroke();
  img = loadImage("myimage3.jpg");
}
void draw () {
  background(255);
  pushMatrix();
  rotate(radians(90));
  imageMode(CENTER);
  image(img, width/2, -height/2);
  popMatrix();
  
  color c;
  loadPixels();
  for (int x = mouseX-50/2; x < mouseX+50/2; x++) {
    for (int y = mouseY-50/2; y < mouseY+50/2; y++) {
      if (mouseX >= 25 && mouseX <= width-25 && mouseY >= 25 && mouseY <= height-25) {
      c = pixels[y*width + x];
      float r = red(c) + 50;
      float g = green(c) + 50;
      float b = blue(c) + 50;
      pixels[y*width + x] = color(r, g, b);
      }
    }
  }
  updatePixels();
}
