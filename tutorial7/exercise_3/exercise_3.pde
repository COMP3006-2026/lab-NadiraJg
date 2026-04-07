int numEarthFrames = 240; // number of animation frames
int frame = 0;            // the frame to display
PImage[] earth = new PImage[numEarthFrames]; 
PImage moon, shuttle;
float angle = 0;          // Current angle of moon
float distance = 150;     // Distance from Earth
float speed = 0.025;      // Rotation speed
boolean shuttleOn = false;
float shuttleSpeed = 0.01;
float shuttleX = width/2;
float shuttleY = height/2-75;
float pct = 0.0;      // percentage travele (0.0 to 1.0);
float step = 0.01;    // size of each step along the path

void setup() {
  size(500, 500);
  frameRate(15);  // maxium 25 fps
  for (int i = 0; i < numEarthFrames; i++) {
    earth[i] = loadImage("earth/" + i + ".gif");
    earth[i].resize(150, 150);
    moon = loadImage("moon.png");
    moon.resize(50, 50);
    shuttle = loadImage("shuttle.png");
    shuttle.resize(30, 30);
  }
}
void draw() {
  background(0);
  frame++;
  if (frame == numEarthFrames) {
    frame = 0;
  }
  imageMode(CENTER);
  image(earth[frame], width/2, height/2);
  
  float moonX = width/2 + distance * cos(angle);
  float moonY = height/2 + distance * sin(angle);
  image(moon, moonX, moonY);
  
  float targetShuttleX = moonX;
  float targetShuttleY = moonY-30;
  //float d = dist(shuttleX, shuttleY, targetShuttleX, targetShuttleY);
  float distX = targetShuttleX - shuttleX;
  float distY = targetShuttleY - shuttleY;
  image(shuttle, shuttleX, shuttleY);
  pct += step;
  //if (pct < 1.0) {
    shuttleX = shuttleX + (pct * distX);
    shuttleY = shuttleY + (pct * distY);
 // }
    
  angle += speed;
}
