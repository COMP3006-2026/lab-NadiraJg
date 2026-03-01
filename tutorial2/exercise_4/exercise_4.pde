void setup() {
  size(200, 200);
}

void draw() {
  drawHuman(50,20,100,150);
}

void drawHuman(float x, float y, float width, float height) {
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  float centerX = x+width/2;
  float headSize = height*0.25;
  float bodyHeight = height*0.40;
  float legHeight = height*0.35;
  float bodyWidth = width*0.25;
  
  // Draw Zoog's body
  stroke(0);
  fill(150);
  float bodyY = y+headSize+bodyHeight/2;
  rect(centerX, bodyY, bodyWidth, bodyHeight);
  
  // Draw Zoog's head
  fill(255); // white
  ellipse(centerX, y+headSize/2, headSize, headSize); 
  
  // Draw Zoog's eyes
  fill(255); // white
  line(centerX-headSize*0.30, y+headSize*0.40,
       centerX-headSize*0.36, y+headSize*0.42);
  line(centerX+headSize*0.30, y+headSize*0.40,
       centerX+headSize*0.36, y+headSize*0.42);
  ellipse(centerX-headSize*0.25, y+headSize*0.45, headSize*0.13, headSize*0.25);
  ellipse(centerX+headSize*0.25, y+headSize*0.45, headSize*0.13, headSize*0.25);
  fill(0,215,255); // blue
  strokeWeight(0);
  ellipse(centerX-headSize*0.25, y+headSize*0.48, headSize*0.10, headSize*0.15);
  ellipse(centerX+headSize*0.25, y+headSize*0.48, headSize*0.10, headSize*0.15);
  
  // Draw Zoog's eyebrow
  strokeWeight(1);
  line(centerX-headSize*0.35, y+headSize*0.30,
       centerX-headSize*0.15, y+headSize*0.33);
  line(centerX+headSize*0.15, y+headSize*0.33,
       centerX+headSize*0.35, y+headSize*0.30);
  
  // Draw Zoog's nose
  line(centerX+headSize*0.02, y+headSize*0.55,
       centerX-headSize*0.02, y+headSize*0.58);
  line(centerX-headSize*0.02, y+headSize*0.58,
       centerX+headSize*0.02, y+headSize*0.60);
  
  // Draw Zoog's mouth
  line(centerX-headSize*0.10, y+headSize*0.70,
       centerX+headSize*0.10, y+headSize*0.70);
  fill(255, 0, 0); // red
  bezier(centerX-headSize*0.05, y+headSize*0.70,
         centerX-headSize*0.02, y+headSize*0.78,
         centerX+headSize*0.02, y+headSize*0.78,
         centerX+headSize*0.05, y+headSize*0.70);
  
  // Draw Zoog's leg
  stroke(0, 0, 255); // blue
  float legStartY = bodyY+bodyHeight/2;
  line(centerX-bodyWidth*0.3, legStartY,
       centerX-bodyWidth*0.6, legStartY+legHeight);
  line(centerX+bodyWidth*0.3, legStartY,
       centerX+bodyWidth*0.6, legStartY+legHeight);
  line(centerX-bodyWidth*0.6, legStartY+legHeight,
       centerX-bodyWidth*0.8, legStartY+legHeight);
  line(centerX+bodyWidth*0.6, legStartY+legHeight,
       centerX+bodyWidth*0.8, legStartY+legHeight);
  
  // Draw Zoog's hands
  line(centerX-bodyWidth/2, bodyY-bodyHeight*0.25,
       centerX-width*0.30, bodyY+bodyHeight*0.15);
  line(centerX-width*0.30, bodyY+bodyHeight*0.15,
       centerX-bodyWidth/2, bodyY+bodyHeight*0.30);
  line(centerX+bodyWidth/2, bodyY-bodyHeight*0.25,
       centerX+width*0.30, bodyY+bodyHeight*0.15);
  line(centerX+width*0.30, bodyY+bodyHeight*0.15,
       centerX+bodyWidth/2, bodyY+bodyHeight*0.30);
  
  // Draw Zoog's ribbon accessory
  stroke(0); // black
  ellipse(centerX, y-headSize*0.15, headSize*0.15, headSize*0.15);
  bezier(centerX+headSize*0.08, y-headSize*0.15,
         centerX+headSize*0.30, y-headSize*0.60,
         centerX+headSize*0.35, y+headSize*0.30,
         centerX+headSize*0.08, y-headSize*0.12);
  
  bezier(centerX-headSize*0.08, y-headSize*0.15,
         centerX-headSize*0.30, y-headSize*0.60,
         centerX-headSize*0.35, y+headSize*0.30,
         centerX-headSize*0.08, y-headSize*0.12);
  
  line(centerX+headSize*0.05, y-headSize*0.15,
       centerX+headSize*0.18, y-headSize*0.20);
  line(centerX+headSize*0.05, y-headSize*0.15,
       centerX+headSize*0.18, y-headSize*0.10);
  line(centerX-headSize*0.05, y-headSize*0.15,
       centerX-headSize*0.18, y-headSize*0.20);
  line(centerX-headSize*0.05, y-headSize*0.15,
       centerX-headSize*0.18, y-headSize*0.10);
}
