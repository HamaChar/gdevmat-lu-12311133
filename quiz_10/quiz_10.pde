ArrayList<Walker> dragWalkers = new ArrayList<Walker>();
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.3f);
PVector wind = new PVector(0.1, 0);

void setup()
{
  frameRate(60);
  background(150);
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 10; i++) // idk why i put it in draw for init lol
  {
    float posX = 2 * (Window.WindowWidth / 11 ) * (i - 5);
    Walker dragWalk = new Walker(new PVector(posX, 800)); 
    
    dragWalk.mass = random(1.5,15); // i = mass
    dragWalk.setScale(dragWalk.mass * 9);
    
    int _h = int(random(360));
    int _s = int(random(25,40));
    int _b = int(random(80,100));
    dragWalk.setCol(_h,_s,_b,250,true);
    dragWalk.update();
    dragWalkers.add(dragWalk);
  }
}

void draw()
{  
  background(160);
  ocean.render();
  
  for (Walker dragWalk : dragWalkers)
  {
    PVector gravity = new PVector(0, -0.25 * dragWalk.mass);
    
    float c = 0.1f;
    float norm = 1;
    float frictMag = c * norm;
    PVector friction = dragWalk.velo.copy();
    
    dragWalk.applyForce(wind);
    dragWalk.applyForce(gravity);
    dragWalk.applyForce(friction.mult(-1).normalize().mult(frictMag));
    dragWalk.applyInertia(true,true,true);
    
    if (ocean.isCollidingWith(dragWalk)){
      dragWalk.applyForce(ocean.calculateDragForce(dragWalk));   
    }
    
    
    dragWalk.update();
    dragWalk.renderCol();
  }
}

void mousePressed()
{
  int i = 0;
  for (Walker object : dragWalkers)
  {
    i++;
    float posX = 2 * (Window.WindowHeight / 11 ) * (i - 5);
    object.pos = new PVector(posX, 800);
    object.velo.mult(0);
    object.mass = random(1.5, 15);
    object.setScale(object.mass * 9);
    
    strokeWeight(1);
    int _h = int(random(360));
    int _s = int(random(25,40));
    int _b = int(random(80,100));
    object.setCol(_h,_s,_b,250,true);
    object.update();
  }
}
