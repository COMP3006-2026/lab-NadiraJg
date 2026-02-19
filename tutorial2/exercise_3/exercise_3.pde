float gray;
boolean loop;
int square, i, j;

void setup() {
  size(100,100);
}

void draw() {
  noStroke();
  
  loop = true;
  square = 5;
  i = 0;
  j = 0;
  
  while(j<100) {
    i=0;
    while(i<100) {
      gray = random(0,255);
      fill(gray);
      rect(i, j, square, square);
      i=i+5;
    }
    j=j+5;
  }
  
}
