ArrayList<Walker> gravWalkers = new ArrayList<Walker>();
PVector wind = new PVector(0.15, 0);

void setup()
{
  frameRate(60);
  background(150);
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  
  // arraylist append
  for (int i = 1; i <= 10; i++) // idk why i put it in draw for init lol
  {
    float posX = 2 * (Window.windowWidth / 10 ) * (i - 5);
    Walker gravWalk = new Walker(new PVector(-posX, 0)); 
    
    gravWalk.mass = i; // i = mass
    gravWalk.setScale(gravWalk.mass * 15);
    
    strokeWeight(1);
    int _h = int(random(360));
    int _s = int(random(25,40));
    int _b = int(random(80,100));
    gravWalk.setCol(_h,_s,_b,160,true);
    
    gravWalkers.add(gravWalk);
  }
}

void draw()
{
  background(150);
  for (Walker object : gravWalkers)
  {
    PVector gravity = new PVector(0, -0.15 * object.mass);
    object.applyForce(gravity);
    object.applyForce(wind);
    object.applyInertia(true,true,true);
    object.update();
    object.renderCol();
  }
}
