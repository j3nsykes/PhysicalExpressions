float posX, posY; //starting positions

void setup(){
  size(500, 500);
  background(0);
  posX = width/2; //start points
  posY = height/2;
}

void draw(){
  // new inputs
  float x = mouseX;
  float y = mouseY;
  
  if (frameCount > 10) {
    // draw line
    stroke(255, 128);
    strokeWeight(3);
    line(x, y, posX, posY);
  }
  
/*extra
    // calculate distance between current and previous values
    float dx = dist(x, y, posX, posY);

    // represent distance in circle size
    // map this into more useful numbers
    float diam = map(dx, 0, 500, 0, 100);
    noFill();
    strokeWeight(1);
    stroke(255, 0, 0);
    ellipse(x, y, diam, diam);
  }
  */
  
  // remember previous values
  posX = x;
  posY = y;

}
