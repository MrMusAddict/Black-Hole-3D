class Photon{
 PVector pos;
 PVector vel;
 color col;
  
  Photon(float x, float y, float z){
   pos = new PVector(x, y, z);;
   vel = new PVector(-c, 0, 0).normalize().setMag(c);
 }
 
 void show(){
  strokeWeight(20);
  stroke(col);
  point(pos.x, pos.y, pos.z);
 }
 
 void update(){
   PVector deltaV = vel.copy();
   
   deltaV.mult(dt);
   if(pos.x > -3000) pos.add(deltaV); 
  
  deltaV.normalize().setMag(255);
  col = color((int) deltaV.x, (int) deltaV.y, (int) deltaV.z);
 }
}
