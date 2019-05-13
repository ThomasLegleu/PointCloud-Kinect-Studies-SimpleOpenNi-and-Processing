import SimpleOpenNI.*;
import peasy.*;
import toxi.geom.*;
import toxi.processing.*;

PeasyCam cam;  
SimpleOpenNI context;

Mesh myMesh;


int     step   = 10; // skipping the points out of array. lower th number higher resolution
float[][] bArray;
float dim = 3000;
float reach = 1300;
int lat = 1;

int lon = 0;

Vec3D tv;
Vec3D hot1 = new Vec3D(0,0,900);
Vec3D hot2 = new Vec3D(0,300,0);
int size = 200;

ArrayList <PVector> tvList;
ArrayList hotList;
ArrayList hotList2;



hotspot hotspot1;
hotspot hotspot2;

void setup()
{
  frameRate(30);

  size(1280, 720, P3D);  // strange, get drawing error in the cameraFrustum if i use P3D, in opengl there is no problem

  //context = new SimpleOpenNI(this,SimpleOpenNI.RUN_MODE_SINGLE_THREADED);
  context = new SimpleOpenNI(this);

  // disable mirror
  context.setMirror(true);

  // enable depthMap generation ,,
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
  myMesh = new Mesh();
  
/////setup box array
  
  
  tvList = new ArrayList <PVector>();
  hotList = new ArrayList();
  hotList2 = new ArrayList();

//  for(int i = 0; i < 1; i++){
//    Vec3D pos = new Vec3D(0, 300, 900);
//    float boxSize = 200;
//    hotspot newA = new hotspot(pos,boxSize);
//   
//    hotList.add(newA); 
//  }
//  
//  
//   for(int i = 0; i < 1; i++){
//    Vec3D pos = new Vec3D(0, 0, 900);
//    float boxSize = 200;
//    hotspot newA = new hotspot(pos,boxSize);
//   
//    hotList2.add(newA); 
//  }
  
  
// hotspot1 = new hotspot(hot1,size);
//hotspot2 = new hotspot(hot2,size);

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
  //camera(0,0,0,0,0,1000,0,-1,0);
  
  
  
  background(0);
  myMesh.run();
  //hotspot1.hotspots();
  //hotspot2.hotspots();
  
  
//      for(int i = 0; i < hotList.size(); i++){
//    hotspot a = (hotspot) hotList.get(i);
//    //float boxSize = random(100,500);
//    //a.render();
//   // a.hotspots();
//  }
//
//    for(int i = 0; i < hotList2.size(); i++){
//    hotspot a = (hotspot) hotList2.get(i);
//    //float boxSize = random(100,500);
//    //a.render();
//    a.hotspots();
//  }


}



void keyPressed(){
  if (key == CODED){
    if(keyCode == UP){
      lon ++;
    } else if (keyCode == DOWN) {
      lon --;
    } else if (keyCode == RIGHT) {
      lat ++;
    } else if (keyCode == LEFT) {
      lat --;
    } 
    println("LONGITUDE ___" + lon);
    println("LATITUDE ___" + lat);
  }
  
 if (keyPressed){
   if(key == '['){
     step ++;
   } else if (key == ']'){
     step --;
   } else if (key == ','){
     reach ++;
   } else if (key == '.'){
     reach --;
   }
   
   println("RESOLUTION ___" + step);
   println("CLIPPING_PLANE__" + reach);
 }
}





