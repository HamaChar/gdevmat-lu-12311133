void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector position = new PVector();
PVector speed = new PVector(5, 8);

Walker baulWalker = new Walker();

void draw()
{
   background(240);
   
   baulWalker.moveAndBounce();
   baulWalker.render();
}
