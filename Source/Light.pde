class Photon {
  PVector pos;
  PVector vel;
  color col;
  boolean stopped = false;

  Photon(float x, float y, float z) {
    pos = new PVector(x, y, z);
    vel = new PVector(-c, 0, 0);
  }

  void show() {
    strokeWeight(2);
    stroke(col);
    point(pos.x, pos.y, pos.z);
  }

  void update() {
    if (!stopped) {
      //Move forward dt (delta time-step)
      PVector deltaV = vel.copy();
      deltaV.mult(dt);
      pos.add(deltaV);
      
      //Set Color of Particle
      deltaV.normalize().setMag(255);
      col = color((int) 255 - deltaV.x, (int) 255 - deltaV.y, (int) 255 - deltaV.z);
    }
  }
}
