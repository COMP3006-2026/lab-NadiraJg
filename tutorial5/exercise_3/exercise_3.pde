void setup() {
  size(200,200);
  background(255);
  String[] data = loadStrings("exercise_3.txt");
  
  for (int i=0; i<data.length; i++) {
    
    String[] shape = split(data[i]," ");
    String[] num = split(shape[1],",");
    
    if (shape[0].equals("ellipse")) 
      ellipse(float(num[0]),float(num[1]),float(num[2]),float(num[3]));
    else if (shape[0].equals("line")) 
      line(float(num[0]),float(num[1]),float(num[2]),float(num[3]));
    else if (shape[0].equals("rect")) 
      rect(float(num[0]),float(num[1]),float(num[2]),float(num[3]));
  }
}
