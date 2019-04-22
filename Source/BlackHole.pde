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

   fill(0);
   noStroke();
   sphere(rs);
   
   fill(100,100);
   sphere(rs*3 + 32);
   
   fill(255,255,0, 100);
   sphere(rs*1.5 + 1);
   
   translate(-pos.x, -pos.y, -pos.z);
   
  }
  
  void pull(Photon p){
    PVector force = new PVector(pos.x - p.pos.x, pos.y - p.pos.y, pos.z - p.pos.z);
    float r = force.mag();
    float fg = G * mass / (r * r);
    force.setMag(fg);
    p.vel.add(force);
    p.vel.normalize().setMag(c);
  }
}
