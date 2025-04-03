ArrayList<Walker> gravWalkers = new ArrayList<Walker>();

void setup()
{
  frameRate(60);
  background(0);
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

void draw()
{
  for (int i = 0; i < 10; i++)
  {
    Walker gravWalk = new Walker(); 
    
    gravWalkers.add(gravWalk);
  }
}
