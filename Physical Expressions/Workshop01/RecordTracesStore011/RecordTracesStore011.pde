float posX, posY; //starting positions

ArrayList <DataPoint> dataPoints = new ArrayList<DataPoint>();//create ArrayList to store data . 
//We must say what object to store the variables in.  

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  // add new inputs
  if (mousePressed) {
    float x = mouseX;
    float y = mouseY;
    dataPoints.add(new DataPoint(x, y)); //add to arrayList
  }

  // The size() method returns the current number of items in the list
  int total = dataPoints.size();
  println("The total amount of data is: " + total);

  //display all data circles - notice size() not length() used. 
for (int i = 0; i < dataPoints.size(); i++) {
  DataPoint d = dataPoints.get(i); //gte the latest stored data. 
  d.display(); //display it. 
}
}

class DataPoint {
  //field(varibales) in class
  float x, y;

  //constructor
  DataPoint(float _x, float _y) {
    x = _x;
    y = _y;
  }

  //methods (functions)
  //show the data with a shape
  void display() {
    noFill();
    stroke(255, 128);
    ellipse(x, y, 30, 30);
  }
}
