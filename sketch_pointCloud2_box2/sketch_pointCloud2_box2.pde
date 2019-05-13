import processing.opengl.*;
import SimpleOpenNI.*;
import peasy.*;
import toxi.geom.*;
import toxi.volume.*;
import toxi.geom.mesh.*;
import toxi.processing.*;

PeasyCam cam;
SimpleOpenNI kinect;
ArrayList wallList;

int kinectWidth = 640;
int kinectHeight = 480;

int boxSize = 150;
PVector boxCenter = new PVector(200,0,900);
PVector boxCenterTwo = new PVector(0,0,200);
ArrayList dots; 



//ArrayList boxCenterTwo;

float reScale;


float s = 1;

void setup(){
 size(1280, 720, OPENGL);
 //cam = new PeasyCam(this,500);
 background(0);
 kinect = new SimpleOpenNI(this);
 
 wallList = new ArrayList();
 dots = new ArrayList();
 
 kinect.enableDepth();
 kinect.enableRGB();
 
  
      for (int i = 0; i < 20 ; i++) {
    Vec3D tempPos = new Vec3D(random(boxCenter.x,boxCenter.x + 250),random(boxCenter.y,boxCenter.y + 250),random(boxCenter.z,boxCenter.z + 250));
    wall newA = new wall(tempPos);
    wallList.add(newA);
    
  }
 
}

void  draw(){
  background(0);
  
// if (frameCount%30 == 0){
//   background(0);
// }

 kinect.update();
 
 
 rotateY(radians(map(mouseX,0,width, -180,180)));
 
// PImage rgbImage = kinect.rgbImage();
 
 translate(width/2, height/2, 900);
 rotateX(radians(180));
 
 lights();
 noStroke();
  
 //stroke(255,0,0);
 
 PVector[] depthPoints = kinect.depthMapRealWorld();
 
 int depthPointsInBox = 0;
 int depthPointsInBox2 = 0;
 
 
 for (int i = 0 ; i < depthPoints.length ; i+=30){
   
    PVector currentPoint = depthPoints[i];
    
    // loop in current points for hot spot
    if (currentPoint.x > boxCenter.x - boxSize/2 && currentPoint.x < boxCenter.x + boxSize/2)
    {
      if(currentPoint.y > boxCenter.y - boxSize/2 && currentPoint.y < boxCenter.y + boxSize/2)
      {
        if(currentPoint.z > boxCenter.z - boxSize/2 && currentPoint.z < boxCenter.z + boxSize/2)
        {
          depthPointsInBox++;
        }
      }
    }
    
//    
     if (currentPoint.x > boxCenterTwo.x - boxSize/2 && currentPoint.x < boxCenterTwo.x + boxSize/2)
    {
      if(currentPoint.y > boxCenterTwo.y - boxSize/2 && currentPoint.y < boxCenterTwo.y + boxSize/2)
      {
        if(currentPoint.z > boxCenterTwo.z - boxSize/2 && currentPoint.z < boxCenterTwo.z + boxSize/2)
        {
          depthPointsInBox2++;
        }
      }
    }
    
    // do something in box if depthpoints are greater than a certain number
    
    if ( depthPointsInBox > 100){
      
        pushMatrix();
        noFill();
        //fill(rgbImage.pixels[i]);
        //translate(boxCenter.x,boxCenter.y, boxCenter.z);
        stroke(255,20);
        //box(10 + depthPointsInBox/2);
        strokeWeight(.1);
        line(boxCenter.x,boxCenter.y, boxCenter.z,currentPoint.x,currentPoint.y,currentPoint.z);
        popMatrix();
        
    }
    
     if ( depthPointsInBox2 > 100){
      
        pushMatrix();
        noFill();
        //fill(rgbImage.pixels[i]);
        translate(boxCenter.x,boxCenter.y, boxCenter.z);
        stroke(0,0,100,10);
        line(boxCenter.x,boxCenter.y, boxCenter.z,1,1,1);
        box(10 + depthPointsInBox2/2);
        popMatrix();
        
    }
    
    println(depthPointsInBox);
 
    //stroke(rgbImage.pixels[i]);
    pushMatrix();
    noStroke();
    //fill(rgbImage.pixels[i]);
    translate(currentPoint.x,currentPoint.y, currentPoint.z);
    fill(random(0,100),0,100);
    box(3);
    popMatrix();
    point(currentPoint.x,currentPoint.y, currentPoint.z); 

 }
 
     for (int i = 0; i < wallList.size(); i++) {
    wall me = (wall) wallList.get(i);

    me.render();
  }
 
 float boxAlpha = map(depthPointsInBox,0,1000,0,255);
 
 fill(100,0,100,boxAlpha);
 translate(boxCenter.x,boxCenter.y,boxCenter.z);
 stroke(255,0,255,10);
 //noFill();
 box(boxSize);
 
 fill(100,0,100,boxAlpha);
 translate(boxCenterTwo.x,boxCenterTwo.y,boxCenterTwo.z);
 //stroke(255,0,255);
 //noFill();
 box(boxSize);

}

void keyPressed() {
  if (keyPressed == true) {

    saveFrame("xxxxxxxx-####.png");
  }
}
