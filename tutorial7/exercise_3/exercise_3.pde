int numEarthFrames = 240; // number of animation frames
int frame = 0;            // the frame to display
PImage[] earth = new PImage[numEarthFrames]; 
PImage moon, shuttle;
float angle = 0;          // Current angle of moon
float distance = 150;     // Distance erom Earth to the moon
float speed = 0.025;      // Orbiting speed of the moon
float shuttleX;
float shuttleY;
float pct = 0.0;      // percentage travele (0.0 to 1.0);
float step = 0.0;     // size of each step along the path
boolean arrived = false;

void setup() {
  size(500, 500);
  shuttleX = width/2;
  shuttleY = height/2-75;
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
  
  if (!arrived) {
    step += 0.005;                            
    float speed = sin(step * PI) * 0.005;    
    pct += speed;                          
  }
  
  if (pct >= 1.0) {
    pct = 1.0;
    arrived = true;
  }
  
  float distX = targetShuttleX - shuttleX;
  float distY = targetShuttleY - shuttleY;
  shuttleX = shuttleX + (pct * distX);
  shuttleY = shuttleY + (pct * distY);
  image(shuttle, shuttleX, shuttleY);
  
  angle += speed;
}
