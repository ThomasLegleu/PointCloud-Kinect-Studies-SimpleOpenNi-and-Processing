class hotspot{
  Vec3D pos;
  float boxSize;
   int depthPointsInBox = 0;
  
  hotspot(float centerX,float centerY,float centerZ ,float _boxSize){
    pos = new Vec3D(centerX, centerY, centerZ);
    boxSize = _boxSize;
  }
  
  void render(){
    
   float boxAlpha = map(depthPointsInBox,0,1000,0,255);
    pushMatrix();
    fill(0,0,255,boxAlpha);
    translate(pos.x, pos.y, pos.z);
    stroke(255);
    strokeWeight(1);
    box(boxSize);
    popMatrix();
    
  }
  
  void hotspots(){
   
   for (int i = 0 ; i < tvList.size() ; i++){
       PVector tv1 = tvList.get(i);
       println(tvList.get(i));
    
       if (tv1.x > pos.x - boxSize/2 && tv1.x < pos.x + boxSize/2)
       {
         if(tv1.y > pos.y - boxSize/2 && tv1.y < pos.y + boxSize/2)
         {
           if(tv1.z > pos.z - boxSize/2 && tv1.z < pos.z + boxSize/2)
           {
             depthPointsInBox++;
           }
         }
       }
     }        
   
  println(depthPointsInBox);
       
    tvList.clear();

    
    
  }
  
  
  
}

