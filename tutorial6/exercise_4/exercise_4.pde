PImage img;

void setup() {
  size(200,200);
  img = loadImage("myimage3.jpg");
  img.resize(width,height);
}

void draw() {
  image(img, 0, 0);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      color c = pixels[y*width + x];
      float r = 255;
      float g = green(c);
      float b = blue(c);
      pixels[y*width + x] = color(r, g, b);
    }
  }
  updatePixels();
  
  copy(img, 0, 0, width/4, height, 3*width/4, 0, width/4, height);
}
