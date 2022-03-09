
Dot d; //initialise class

void setup() {
  size(500, 500);
  background(0);
  
  //create a new instance of the object
  d = new Dot(50,100,50); //put numbers in for the x,y,r fields
  
  //try create a second instance?
  
}

void draw() {
  
   d.display(); //display it.
}

class Dot {
  //field(varibales) in class
  //try add another field? 
  int x, y, r;

  //constructor 
  Dot(int _x, int _y, int _r) {
    x=_x;
    y=_y;
    r=_r;
  }

  //methods (functions)
  //show the info with a shape
  void display() {
    strokeWeight(1);
    stroke(0, 255, 0);
    noFill();
    ellipse(x, y, r, r);
  }
}//close of class 
