class Mesh{
  PVector[] worldMap;
  PImage colMap;
  int x_Width;
  int y_Height;
  
  Mesh(){
    worldMap = context.depthMapRealWorld();
    x_Width = context.depthWidth();
    y_Height = context.depthHeight();
    
    
  }
  
  void run(){
    update();
    keyPressed();
      
  }
  
  void update(){
    
    context.update(); // update the kinect every time.
    PImage colMap = context.rgbImage(); // video pro the kinect
    int[]   depthMap = context.depthMap();
    PVector[] realWorldMap = context.depthMapRealWorld(); // setting up the actual pointcloud

    for (int y=0;y < y_Height - step;y += step) // rows of the context
    {
      for (int x=0;x < x_Width - step ;x += step) // elements in the row
      {
        int index = x + (y * x_Width);
        int colIndex = x - 10  + ((y+30) * x_Width);
        PVector point = worldMap[index];
                
        stroke(255);
        point(point.x, point.y, point.z);
        
        if( point.z < reach && point.z > -100){
      
        tv = new Vec3D(point.x, point.y, point.z);
        tvList.add(tv);
          
      if( y > step){
        if (x > step){
          
          PVector triangle1a = worldMap[x + (y * x_Width)]; // initial point
          PVector triangle1b = worldMap[int(x + (y * x_Width) - x_Width * step)];
          PVector triangle1c = worldMap[int((x-step) + (y * x_Width) - x_Width * step)];
          
          float atobOne = PVector.dist(triangle1a, triangle1b);
          float btocOne = PVector.dist(triangle1b, triangle1c);
          
          PVector triangle2a = worldMap[x + (y * x_Width)];
          PVector triangle2b = worldMap[int((x-step) + (y * x_Width)-x_Width*step)];
          PVector triangle2c = worldMap[index - step];
          
          float atobTwo = PVector.dist(triangle2a, triangle2b);
          float btocTwo = PVector.dist(triangle2b, triangle2c);
          
          if(atobOne < step*10 && btocOne < step*10){
            noStroke();
            beginShape(TRIANGLES);
            
            fill(colMap.pixels[index+15]);
            
            vertex(triangle1a.x, triangle1a.y, triangle1a.z);
            vertex(triangle1b.x, triangle1b.y, triangle1b.z);
            vertex(triangle1c.x, triangle1c.y, triangle1c.z);
            
            endShape();
          }
          
          if(atobTwo < step*10 && btocTwo < step*10){
            noStroke();
            beginShape(TRIANGLES);
            
            fill(colMap.pixels[index+lat + (lon * x_Width)]);
            
            vertex(triangle2a.x, triangle2a.y, triangle2a.z);
            vertex(triangle2b.x, triangle2b.y, triangle2b.z);
            vertex(triangle2c.x, triangle2c.y, triangle2c.z);
            
            endShape();
          }
          
        }
        
      }
      
      }
        
      }
    }
  }
}
