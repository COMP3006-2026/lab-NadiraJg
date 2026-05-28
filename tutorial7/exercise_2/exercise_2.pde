int numEarthFrames = 240;  // number of animation frames
int frame = 0;       // the frame to display
PImage[] earth = new PImage[numEarthFrames]; 
PImage moon;
float angle = 0;        // Current angle of moon
float distance = 120; // Distance from Earth
float speed = 0.025;     // Rotation speed

void setup() {
  size(400, 400);
  smooth();
  frameRate(15);  // maximum 25 fps
  for (int i = 0; i < numEarthFrames; i++) {
    earth[i] = loadImage("images/" + i + ".gif");
    earth[i].resize(100, 100);
    moon = loadImage("moon.png");
    moon.resize(50, 50);
  }
}
void draw() {
  fill(0, 40);
  rect(0, 0, width, height);

  frame++;
  if (frame == numEarthFrames) {
    frame = 0;
  }
  imageMode(CENTER);
  image(earth[frame], width/2, height/2);
  
  float x = width/2 + distance * cos(angle);
  float y = height/2 + distance * sin(angle);
  image(moon, x, y); 
  angle += speed;
}
