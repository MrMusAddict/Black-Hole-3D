class BH {
  PVector pos;
  float mass;
  float rs;
  
  BH(float x, float y, float z, float m) {
    pos = new PVector(x, y, z);
    mass = m;
    rs = (2*G*mass) / (c*c);
  }
  
  void show(){
    
    translate(pos.x, pos.y, pos.z);

   fill(255,0,0);
   noStroke();
   sphere(rs);
   
   fill(255,255,0, 100);
   sphere(rs*1.5);
   
   fill(100,100);
   sphere(rs*3);
   
   translate(-pos.x, -pos.y, -pos.z);
   
  }
  
  void pull(Photon p){
    PVector force = new PVector(pos.x - p.pos.x, pos.y - p.pos.y, pos.z - p.pos.z);
    float r = force.mag();
    float fg = G * mass / (r * r);
   
    force.setMag(c).mult(fg * (dt / c)).mult(1/abs(1.0 - 2.0 * G * mass / (r * c * c)));
    
    p.vel.add(force).setMag(c);
    
    if(r <= rs+ 0.5){
     p.stopped = true; 
    }
  }
}
