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
line(82, 64, 78, 65);
line(118, 64, 122, 65);
ellipse(85, 70, 8, 16);
ellipse(115, 70, 8, 16); 

// Draw Zoog's eyebrow
line(80, 57, 90, 60);
line(110, 60, 120, 57);

// Draw Zoog's nose
line(101, 74, 98, 76);
line(98, 76, 101, 77);

// Draw Zoog's mouth
line(94, 86, 106, 86);
fill(255, 0, 0); // red
bezier(97, 86, 99, 92, 101, 92, 103, 86);

// Draw Zoog's leg
stroke(0, 0, 255);
line(90, 150, 85, 170);
line(110, 150, 115, 170);
line(85, 170, 82, 170);
line(115, 170, 118, 170);

// Draw Zoog's hands
line(90, 100, 70, 115);
line(70, 115, 90, 130);
line(110, 100, 130, 115);
line(130, 115, 110, 130);

// Draw Zoog's ribbon accessory
stroke(0);
circle(100, 40, 10);
bezier(105, 39, 125, 5, 130, 65, 105, 41);
bezier(95, 39, 75, 5, 70, 65, 95, 41);
line(105, 40, 112, 38);
line(105, 40, 112, 42);
line(95, 40, 88, 38);
line(95, 40, 88, 42);
