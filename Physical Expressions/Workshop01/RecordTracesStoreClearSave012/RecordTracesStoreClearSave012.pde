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
  //get all but last in store if also wanting to display next. 
  for (int i = 0; i < dataPoints.size()-1; i++) {
    DataPoint d = dataPoints.get(i); //gte the latest stored data. 


    DataPoint newd = dataPoints.get(i+1); //gte the next stored data.
    //lets draw a line between the last and next data
    stroke(0, 255, 0, 128);
    strokeWeight(1);
    line(d.x, d.y, newd.x, newd.y);

    d.display(); //display it.
  }
}

void keyPressed() {
  switch(key) {
  case ' ':
    dataPoints.clear();
    break;
  case 's':
    println("SAVE FILE AS CSV HERE!");
    // Table object 
  saveData("data");
    break;

  case 'l':
    println("LOAD DATA!");
    // Table object 
    loadData("data");
    break;
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

///CSV control

void saveData(String _f) {
  println("SAVING DATA AS CSV...");
  // create the Table to hold the data
  Table data = new Table();
  // add the columns to hold the data
  data.addColumn("xpos");
  data.addColumn("ypos");

  // step through the array of objects and put each into a TableRow
  for (DataPoint d : dataPoints) {
    // add a new row for each object in our array
    TableRow newRow = data.addRow();
    // set the values from each object to their associated column name
    newRow.setFloat("xpos", d.x);
    newRow.setFloat("ypos", d.y);
  }
  // once done save it
  saveTable(data, "data/"+_f+".csv");

  println("DONE!");
}

void loadData(String _f) {
  println("LOADING DATA FROM CSV...");
  // firstly clear existing data
  dataPoints.clear();
  // load the data into a Table object
  Table data = loadTable("data/"+_f+".csv", "header");
  // step through the Table a row at a time
  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);
    // get the data from each row and store in a temp variable
    float x = row.getFloat("xpos");
    float y = row.getFloat("ypos");

    // construct a new object from the class with this data
    DataPoint d = new DataPoint(x, y);
    // add the new DataObject to our array
    dataPoints.add(d);
  }
  println("DONE!");
}
