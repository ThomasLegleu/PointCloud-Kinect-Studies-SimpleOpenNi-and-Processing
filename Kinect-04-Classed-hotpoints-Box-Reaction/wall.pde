 class wall{
  Vec3D pos;

  
  wall(Vec3D _pos){
    pos = _pos.copy();

  }
  
  void render(){
    //fill(255,0,0);
    stroke(255,0,255);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
       //scale(1,1,100);
       //sphere(5);
    noFill();
    box(10);
    popMatrix();
  }
 
  
}
