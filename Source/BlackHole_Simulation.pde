import peasy.*;

PeasyCam cam;

float c = 30;
float G = 6;
float dt = 0.1;

int pCount = 5000;

ArrayList<Photon> particles;

BH m87;

void setup() {
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 2000);

  particles = new ArrayList<Photon>();

  for (int i = 0; i < pCount; i++) {
    float a = random(TWO_PI);
    float r = 300.0 * sqrt(random(1.0));

    
    particles.add(new Photon(random(1000)+1000, r*cos(a), r*sin(a)));

  }
  
  m87 = new BH(0, 0, 0, 3000);
}

void draw() {
  background(0);
  lights();
  m87.show();

  for (Photon p : particles) {
    m87.pull(p); 
    p.update();
    p.show();
  }

  println(cam);
}
