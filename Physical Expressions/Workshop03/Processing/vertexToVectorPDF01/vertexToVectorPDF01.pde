import processing.pdf.*; //pdf library 
boolean saveOneFrame = false; //boolean to control saving
PVector pos; // position variable
ArrayList<PVector> vex = new ArrayList<PVector>(); //create an arrayList of vector to store points
//you can send your incoming data into this later on should you wish. 

void setup() {
  size(800, 800);
  background(255);
  pos = new PVector(width, height); //create a new PVector for positions
}

void draw() {
  if (saveOneFrame == true) {
    beginRecord(PDF, "test.pdf"); //save pdf at top of draw loop to capture all details.
  }
  stroke(0);
  noFill();
  strokeWeight(0.5);
  float x = mouseX;
  float y = mouseY;
  pos = new PVector(x, y); // PVector has mouse X and Y parsed into it

  //store x,y positions in vector
  vex.add(pos); 


  beginShape(); //begin shape for vertex drawing
  for (int i = 0; i < vex.size(); i++) { //this is similar to our method in recording traces. 
    PVector p = vex.get(i); //get values from stored vector
    curveVertex(p.x, p.y); //draw curve vertex
  }
  endShape();
  if (saveOneFrame == true) { //if true save pdf
    endRecord();
    saveOneFrame = false;
  }
}

void keyPressed() {
  saveOneFrame = true;
}
