import peasy.*;

PeasyCam cam;

float c = 30;
float G = 6;
float dt = 0.05;

int pCount = 5000;

ArrayList<Photon> particles;

BH m87;

void setup(){
  fullScreen(P3D, 3);
  cam = new PeasyCam(this, 2000);
  ellipseMode(RADIUS);
  m87 = new BH(0, 0, 0, 3000);
  
  
  particles = new ArrayList<Photon>();
  for(int i = 0; i < pCount; i++){
    float py = height/1.0/pCount*i - height/2.0;
    //particles.add(new Photon(3 * width / 2.0, py));
    particles.add(new Photon(1000, random(2000)-1000, random(2000)-1000));
  }
}

void draw(){
  background(255);
  lights();
  m87.show();
  
  for(Photon p : particles){
    m87.pull(p); 
    
    p.update();
   p.show(); 
  }
  
  println(cam);
}
