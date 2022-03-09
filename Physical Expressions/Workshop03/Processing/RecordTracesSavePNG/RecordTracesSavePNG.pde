float posX, posY; //starting positions

ArrayList <DataPoint> dataPoints = new ArrayList<DataPoint>();//create ArrayList to store data . 
//We must say what object to store the variables in.  

PGraphics pg; //requires a pgraphics render
float x, y;

void setup() {
  size(500, 500);
  //background(255);
  pg=createGraphics(width, height);//make the graphic the same as the canvas w and h
  pg.beginDraw();
  pg.background(255);
  pg.endDraw();
}

void draw() {


  pg.beginDraw(); //start pgraphics 
  // add new inputs
  if (mousePressed) {
    x = mouseX;
    y = mouseY;
    dataPoints.add(new DataPoint(x, y)); //add to arrayList
  }




  // The size() method returns the current number of items in the list
  int total = dataPoints.size();
  println("The total amount of data is: " + total);

  //display all data circles - notice size() not length() used. 
  for (int i = 0; i < dataPoints.size()-1; i++) {
    DataPoint d = dataPoints.get(i); //gte the latest stored data. 
    DataPoint newd = dataPoints.get(i+1); //gte the next stored data.
    //lets draw a line between the last and next data
    pg.stroke(0, 255, 0, 128);
    pg.strokeWeight(1);
    pg.line(d.x, d.y, newd.x, newd.y);

    d.display(); //display it.
  }
  pg.endDraw(); //end pgraphgics
  image(pg, 0, 0, width, height); //display new graphic
}

void keyPressed() {
  pg.save("test.png"); //save the file.
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
    pg.noFill(); //remember to use your pgraphic for styling. 
    pg.strokeWeight(0.25);
    pg.stroke(60);
    pg.ellipse(x, y, 30, 30);
  }
}
