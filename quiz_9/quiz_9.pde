ArrayList<Walker> brakeWalkers = new ArrayList<Walker>();

void setup()
{
  frameRate(60);
  background(150);
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  
  // arraylist append
  for (int i = 0; i < 10; i++) // idk why i put it in draw for init lol
  {
    float posY = 2 * (Window.WindowHeight / 14 ) * (i - 5);
    Walker brakeWalk = new Walker(new PVector(-500, posY)); 
    
    brakeWalk.mass = i + 2; // i = mass
    brakeWalk.setScale(brakeWalk.mass * 12);
    
    strokeWeight(1);
    int _h = int(random(360));
    int _s = int(random(25,40));
    int _b = int(random(80,100));
    brakeWalk.setCol(_h,_s,_b,160,true);
    
    brakeWalkers.add(brakeWalk);
  }
}

void draw()
{
  background(150);
  for (Walker object : brakeWalkers)
  {
    float mew = 0.01f;
    float normal = .5;
    if(object.pos.x >= 0){mew = 0.4f;}
    float frictMag = mew * normal;
    
    PVector friction = object.velo.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictMag);
    
    
    PVector akselerasyon = new PVector(0.2 / object.mass, 0);
    
    
    object.applyForce(friction);
    object.applyForce(akselerasyon);
    object.update();
    object.renderCol(); 
  }
}

void mousePressed()
{
  int i = 0;
  for (Walker object : brakeWalkers)
  {
    i++;
    float posY = 2 * (Window.WindowHeight / 14 ) * (i - 5);
    object.pos = new PVector(-500, posY);
    object.velo.mult(0);
    
    strokeWeight(1);
    int _h = int(random(360));
    int _s = int(random(25,40));
    int _b = int(random(80,100));
    object.setCol(_h,_s,_b,160,true);
  }
}
