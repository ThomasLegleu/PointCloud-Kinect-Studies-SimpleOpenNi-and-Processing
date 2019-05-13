

import SimpleOpenNI.*;
import peasy.*;
import toxi.geom.*;
import toxi.processing.*;

PeasyCam cam;  
SimpleOpenNI context;


int step   = 10;

float[][] bArray;

float dim = 3000;

Vec3D tv;

ArrayList attList;
ArrayList tvList;
ArrayList currentList;

void setup()
{
  frameRate(30);

  size(1280, 720, P3D);  // strange, get drawing error in the cameraFrustum if i use P3D, in opengl there is no problem
  
  attList = new ArrayList();
  tvList = new ArrayList();
  currentList = new ArrayList();
  
  
  for(int i = 0; i < 10; i++){
    Vec3D pos = new Vec3D(random(-400,400), random(-300,300), 600);
    float boxSize = 20;
    attractor newA = new attractor(pos,boxSize);
   
    attList.add(newA);
  }
    
 

  //context = new SimpleOpenNI(this,SimpleOpenNI.RUN_MODE_SINGLE_THREADED);
  context = new SimpleOpenNI(this);

  // disable mirror
  context.setMirror(true);

  // enable depthMap generation 
  if (context.enableDepth() == false)
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }
  if (context.enableRGB() == false)
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }
  initPeasyCam();

  smooth();
  
  

  
  /////setup box array
  
  

}

void initPeasyCam() {
 cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(1);
  cam.setMaximumDistance(100000);
  //cam.setDistance(400);
  cam.setRotations(0,PI,PI);
}

void draw()
{
  camera(0,0,0,0,0,1000,0,-1,0);
  
  background(0);
  drawPoints();
  
  
    for(int i = 0; i < attList.size(); i++){
    attractor a = (attractor) attList.get(i);
    //float boxSize = random(100,500);
    //a.render();
    a.hotspot();
  }
  


}

void drawPoints(){
  
  context.update();
  PImage colMap = context.rgbImage();
  int[]   depthMap = context.depthMap();
  strokeWeight(step);
  
  PVector[] realWorldMap = context.depthMapRealWorld();
  for (int y=0;y < context.depthHeight() - step;y+=step)
  {
    for (int x=0;x < context.depthWidth()-step;x+=step)
    {
      int index1 = x + (y * context.depthWidth());

      int colIndex = x -10+ ((y+30) * context.depthWidth());

      // draw the projected point
      // realWorldPoint = context.depthMapRealWorld()[index]
      
      PVector point1 = realWorldMap[index1];
      
      tv = new Vec3D(point1.x, point1.y, point1.z);
      tvList.add(tv);
      
      
      if (colIndex < colMap.pixels.length && tv.z < 2000) {
        stroke(255,0,0);
        //stroke(random(0,255));
        point(tv.x, tv.y, tv.z);          
          
        } 
      }
    }
  } 





