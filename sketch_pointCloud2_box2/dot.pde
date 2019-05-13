class Dot {
  PVector loc;
  PVector vel;
 
  Dot() {
    loc = new PVector(0,0,0);
    vel = new PVector(random(-1, 1), random(-1, 1),random(-1, 1));
  }
 
  void draw() {
    //if (dist(loc.x, loc.y, width/2, height/2) >= 255) vel.mult(-1);
    loc.add(vel);
    //stroke(0, 150, 255, 255-map(dist(loc.x, loc.y, width/2, height/2), 0, 255, 0, 230));
    translate(loc.x, loc.y,loc.z);
    stroke(0,0,100,10);
    box(10);
    popMatrix();
    //point(loc.x, loc.y,loc.z);
  }
}

