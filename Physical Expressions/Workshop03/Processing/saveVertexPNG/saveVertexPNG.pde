PGraphics pg; //create PGraphic object
ArrayList<PVector> vex = new ArrayList<PVector>(); //create an arrayList for a PVector

void setup() {
  size(800, 800);
  background(255);
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(255);
  pg.endDraw();
}


void draw() {

  float x = mouseX;
  float y = mouseY;
  PVector pos = new PVector(x, y); //parse the x and y into the PVector

  if (frameCount%10 == 0) { //slow it down a little
    vex.add(pos);//store the values
  }

  //draw to PGraphics
  pg.beginDraw();
  pg.beginShape();
  pg.stroke(0);
  pg.strokeWeight(1);
  for (int i = 0; i < vex.size(); i++) { //cycle through all the stored points. 
    PVector p = vex.get(i);
    pg.curveVertex(p.x, p.y);
    //straight line
    //pg.vertex(p.x,p.y);
  }
  pg.endShape();
  pg.endDraw();

//render to image
  image(pg, 0, 0, width, height);
}

void keyPressed() {
  pg.save("test.png");
}
