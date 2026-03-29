size(400,400);
PImage img = loadImage("myimage1.jpg");
PImage img2 = loadImage("myimage2.jpg");
image(img, 0, 0, width, height);
//image(img2, 0, 0, 100, 100);
blend(img2, 0, 0, width/2, height, width/2, 0, width/2, height, DARKEST); 
