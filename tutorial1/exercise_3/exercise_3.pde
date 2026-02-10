size(200, 200);

ellipseMode(CENTER);
rectMode(CENTER);

// Draw Zoog's body
stroke(0);
fill(150);
rect(100, 100, 20, 100); 

// Draw Zoog's head
fill(255); // white
ellipse(100, 70, 60, 60); 

// Draw Zoog's eyes
fill(0 , 215, 255); // blue
ellipse(81, 70, 8, 16);
ellipse(119, 70, 8, 16); 

line(89, 86, 111, 86);

// Draw Zoog's leg
stroke(0, 0, 255);
line(90, 150, 80, 160);
line(110, 150, 120, 160);

line(90, 

// Draw the rope curve
stroke(0, 255, 0);
noFill(); 
bezier(20, 100, 20, 200, 180, 200, 180, 100);
