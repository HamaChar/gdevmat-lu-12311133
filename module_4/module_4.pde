void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

float time = 0;
int speed = 16;

Walker perlinWalker = new Walker();

void draw()
{
  float randR = map(noise(time + 555 * 321), 0, 1, 0, 255);
  float randG = map(noise(time + 123 * 652), 0, 1, 0, 255);
  float randB = map(noise(time + 155 * 1512), 0, 1, 0, 255);
  float randA = map(noise(time + 5555), 0, 1, 0, 255);
  
  float randSize = map(noise(time * .2), 0, 1, 5, 150);
  
  noStroke();
  perlinWalker.perlinWalk(speed);
  perlinWalker.renderCol(randR,randG,randB,randA,randSize);
  
  time += 0.05f;
}  
