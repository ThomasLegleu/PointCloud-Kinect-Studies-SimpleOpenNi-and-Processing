class attractor{
  Vec3D pos;
  float boxSize;
  
  attractor(Vec3D _pos, float _boxSize){
    pos = _pos.copy();
    boxSize = _boxSize;
  }
  
  void render(){
    fill(255,0,0);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    box(boxSize);
    popMatrix();
  }
  
  void hotspot(){
    
   int depthPointsInBox = 0; 
     //Vec3D currentPoint = tv;
    
    
    // loop in current points for hot spot
    if (tv.x > pos.x - boxSize/2 && tv.x < pos.x + boxSize/2)
    {
      if(tv.y > pos.y - boxSize/2 && tv.y < pos.y + boxSize/2)
      {
        if(tv.z > pos.z - boxSize/2 && tv.z < pos.z + boxSize/2)
        {
          depthPointsInBox++;
        }
      }
    }
          
          
          
 float boxAlpha = map(depthPointsInBox,0,1000,0,255);
//

    noFill();
    //pushMatrix();
    translate(pos.x, pos.y, pos.z);
   // stroke(255);
    strokeWeight(1);
    box(boxSize);
    //popMatrix();

    
    
  }
  
  
  
}




