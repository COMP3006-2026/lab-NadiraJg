PrintWriter output;
String input = "";
boolean isFloat = false;

void setup() {
  size(100,100);
  output = createWriter("words.txt");
}

void draw() {
  background(255);
  fill(0);
  smooth();
  textSize(10);
  text("Input numbers here: \n" + input, 0, 50);
}

void keyPressed() {  
  
  // get numbers from user
  if (key >= '0' && key <= '9') {
    input+=key;
  }
  else if (key == ' ') { // spacebar is pressed,the number is written to words.txt file
    if (!isFloat) {
      int i = int(input);
      output.println(nf(i,10)); // Integer: 10 digits in total
    }
    else {
      float i = float(input);
      output.println(nf(i,6,4)); // Float: 6 digits at the left and 4 digits at the right of the decimal point
    }
    input = ""; // clear input
    isFloat = false; // set isFloat to default
  }
  // to check if a number is a float
  else if (key == '.') {
    isFloat = true;
  }
  else if (key == ENTER) {
    output.flush();    // write the remaning data
    output.close();    // finish the file
    exit();            // stop the program
  }
  
}
