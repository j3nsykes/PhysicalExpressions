PVector pos; //PVector variable name
ArrayList<PVector> vex = new ArrayList<PVector>();//store the PVector values in ArrayList
float posX, posY; //starting positions

void setup() {
  size(500, 500);
  background(255);
}

void draw() {


  //Debugging
  float x = mouseX; //use mouse pos as new PVector positions for testing
  float y = mouseY;
  pos = new PVector(x, y);

  // add new inputs
  if (mousePressed) {
    vex.add(pos);
  }
  stroke(0);
  beginShape();
  for (int i = 0; i < vex.size(); i++) {
    PVector p = vex.get(i);
    curveVertex(p.x, p.y);
  }
  endShape();
}

void keyPressed() {
  switch(key) {

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


///CSV control

void saveData(String _f) {
  println("SAVING DATA AS CSV...");
  // create the Table to hold the data
  Table data = new Table();
  // add the columns to hold the data
  data.addColumn("xpos");
  data.addColumn("ypos");



  // step through the array of objects and put each into a TableRow
  for (int i = 0; i < vex.size(); i++) {
    PVector p = vex.get(i);
    // add a new row for each object in our array
    TableRow newRow = data.addRow();
    // set the values from each object to their associated column name
    //save this data for a 2D visual right now.
    newRow.setFloat("xpos", p.x);
    newRow.setFloat("ypos", p.y);

    //save all the data for future 3D use
  }
  // once done save it
  saveTable(data, "data/"+_f+".csv");

  println("DONE!");
}

void loadData(String _f) {
  println("LOADING DATA FROM CSV...");
  // firstly clear existing data

  // load the data into a Table object
  Table data = loadTable("data/"+_f+".csv", "header");
  // step through the Table a row at a time
  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);
    // get the data from each row and store in a temp variable
    float x = row.getFloat("xpos");
    float y = row.getFloat("ypos");
    pos = new PVector(x, y);
    vex.add(pos);
  }
  println("DONE!");
}
