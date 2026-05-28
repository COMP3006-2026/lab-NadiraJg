PFont font;
String letters = "";
int y = 30, x = 0, line = 1;

void setup() {
  size(200, 100);
  font = loadFont ("ArialMT-24.vlw");
  textFont(font);
  stroke(255);
  fill(0);
}
void draw() {
  background(204);
  textSize(15);
  text(letters, x, y);
}

void keyPressed (){
  if (key == BACKSPACE) {
    if (letters.length() > 0){
      letters = letters.substring(0, letters.length()-1);
    } 
  }
  if (line > 3)
    return;
  else if (key == ENTER || key == RETURN) {
    line++;
    if (line <= 3)
      letters = letters + '\n';
  }
  else if (textWidth(letters + key) < width) {
    letters = letters + key;
  }
  else if (textWidth(letters + key) >= width) {
    line++;
    if (line <= 3)
      letters = letters + '\n' + key;
  }
}
