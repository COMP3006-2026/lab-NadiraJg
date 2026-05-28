String[] data;
int male=0, female=0, after2003=0;

void setup() {
  data = loadStrings("T4q7.csv");
  for (int i=0; i<data.length; i++) {
    if (i < 2)
      continue;
    String[] col = split(data[i], ',');
    if (col[4].equals("Male"))
      male++;
    else
      female++;
    if (int(col[5]) > 2003)
      after2003++;
  }
  println("Number of males: " + male);
  println("Number of females: " + female);
  println("Born after 2003: " + after2003);
  
  exit();
}
