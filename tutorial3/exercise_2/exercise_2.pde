size(620, 200);
noStroke();
fill(0);
beginShape();
vertex(0, 200);
for (int i = 20; i < 580; i+=60) {
  vertex(i, 200-(200/8)*3);
  vertex(i+(40/2), 200-197);
  vertex(i+40, 200-(200/8)*3);
  if (i<540)
    vertex(i+60, 200-(200/8)*3);
}
vertex(620, 200);
endShape();
