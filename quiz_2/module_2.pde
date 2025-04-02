void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker theWalker = new Walker();
Walker biasedWalker = new Walker();
Walker horizonWalker = new Walker();

void draw()
{
  tint(255,255,255,50);
  //int rng = ceil(random(4)); // I think I'll prefer ceil.... OCD? lol
  //println(rng);
  
  theWalker.randomWalk();
  theWalker.render();
  
  int randR = ceil(random(0,255));
  int randG = ceil(random(0,255));
  int randB = ceil(random(0,255));
  int randA = ceil(random(50,100));
  
  biasedWalker.randomWalkBiased(55, 20, 30, 40);
  biasedWalker.renderCol(randR,randG,randB,randA);
  
  horizonWalker.randomWalkBiased(5,5,50,20);
  horizonWalker.renderCol(randG,randB,randR,10);
}
