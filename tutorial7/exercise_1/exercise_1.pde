int numEarthFrames = 240;  // number of animation frames
int frame = 0;       // the frame to display
PImage[] earth = new PImage[numEarthFrames]; 
PImage moon;
float angle = 0;        // Current angle of moon
float distance = 240;   // Distance from Earth
float speed = 0.025;    // Rotation speed

void setup() {
  size(500, 500);
  frameRate(15);  // maxium 25 fps
  moon = loadImage("images/moon.png");
  moon.resize(50, 50);
  for (int i = 0; i < numEarthFrames; i++) {
    earth[i] = loadImage("images/" + i + ".gif");
    earth[i].resize(100, 100);
    moon = loadImage("images/moon.png");
    moon.resize(50, 50);
  }
}

void draw() {
  background(0);
  if (frame == numEarthFrames) {
    frame = 0;
  }
  
  float x = width/2 + distance * cos(angle);
  float y = height/2 + distance * sin(angle) * 0.2;
  
  if (sin(angle) < 0)
    image(moon, x, y); 
    
  imageMode(CENTER);
  image(earth[frame], width/2, height/2);
  frame++;
  
  if (sin(angle) > 0)
    image(moon, x, y); 
    
  angle += speed;
}
