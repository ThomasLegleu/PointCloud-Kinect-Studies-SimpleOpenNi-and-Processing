class hotspot{
  Vec3D pos;
  float boxSize;
  
  hotspot(Vec3D _pos, float _boxSize){
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
  
  void hotspots(){
    
   int depthPointsInBox = 0; 
     //Vec3D currentPoint = tv;
    
    
     for (int i = 0 ; i < tvList.size() ; i++){
       
     tvList.get(i);
    
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
          
 }        
   
  println(depthPointsInBox);
          
 float boxAlpha = map(depthPointsInBox,0,1000,0,255);
//

    noFill();
    //pushMatrix();
    translate(pos.x, pos.y, pos.z);
    stroke(255);
    strokeWeight(1);
    box(boxSize);
    //popMatrix();

    
    
  }
  
  
  
}

