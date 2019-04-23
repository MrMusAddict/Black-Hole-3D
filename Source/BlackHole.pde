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
    
    float fxTheta = acos(force.z/r);
    float fxPhi = atan2(force.y, force.x);
    
    float deltaTheta = -fg * (dt / c) * sin(p.theta - fxTheta);
    float deltaPhi = -fg * (dt / c) * sin(p.phi - fxPhi);
    
  
    deltaTheta /= abs(1.0 - 2.0 * G * mass / (r * c * c));
    deltaPhi /= abs(1.0 - 2.0 * G * mass / (r * c * c));
    
    p.theta += deltaTheta;
    p.phi += deltaPhi;
    
    p.vel = new PVector(p.rad * sin(p.theta)*cos(p.phi), p.rad * sin(p.theta)*sin(p.phi), p.rad * cos(p.theta)).normalize().setMag(c);
    
    if(r <= rs+ 0.5){
     p.stopped = true; 
    }
    
  }
}
