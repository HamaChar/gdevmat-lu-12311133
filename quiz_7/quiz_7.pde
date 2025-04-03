ArrayList<Walker> matterWalkers = new ArrayList<Walker>();
Walker holeWalker;
float matterSpd = 12;
float steerPwr = 0.12; //I just change the power level, and made name a bit more clear lmao
int resetCnt = 0;


void setup()
{
  frameRate(60);
  background(0);
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //
  //    SETUP
  // 
  noStroke();
  holeWalker = new Walker();
  float hwx = random(-Window.windowWidth,Window.windowWidth);
  float hwy = random(-Window.windowHeight,Window.windowHeight);
  holeWalker.pos = new PVector(hwx,hwy);
  holeWalker.setSize(50);
  holeWalker.setCol(255,255,255,255);
  
  for (int i = 0; i < 100; i++)
  {
    float gauss = randomGaussian();
    float otherGauss = randomGaussian();
    
    
    int randH = ceil(random(360));
    int randS = ceil(random(20,40));
    int randB = ceil(random(80,100));
    int randA = ceil(random(50,100));
    float randSize = random(5,50);
  
    
    float x = gauss * 200;
    float y = otherGauss * 200 * .6;
    PVector pos = new PVector(x,y);
    PVector dir = PVector.sub(holeWalker.pos, pos);
    dir.normalize().mult(matterSpd);
    
    Walker thisWalker = new Walker(pos,dir);
    thisWalker.setCol(randH,randS,randB,randA,true);
    thisWalker.setSize(randSize);
    matterWalkers.add(thisWalker);
  }  
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x,y);
}

boolean isLMBDown = false;
void mousePressed(){isLMBDown = true;}
void mouseReleased(){isLMBDown = false;}

void draw()
{
  background(0); //flush toilet
  resetCnt++;
  if (resetCnt >= 600)
  {
    float hwx = random(-Window.windowWidth,Window.windowWidth);
    float hwy = random(-Window.windowHeight,Window.windowHeight);
    holeWalker.pos = new PVector(hwx,hwy);
    
    for (Walker matter : matterWalkers)
    {
      int randH = ceil(random(360));
      int randS = ceil(random(15,40));
      int randB = ceil(random(80,100));
      int randA = ceil(random(70,100));
      float randSize = random(5,50);
      
      float gauss = randomGaussian();
      float otherGauss = randomGaussian();
      float x = gauss * 200;
      float y = otherGauss * 200 * .6;
      PVector pos = new PVector(x,y);
      matter.pos = pos;
      matter.velo.mult(0); //reset velocity every flush
      matter.setCol(randH,randS,randB,randA,true);
      matter.setSize(randSize);
    }
    resetCnt = 0;
  };
  
  for (Walker matter : matterWalkers){

    PVector.sub(holeWalker.pos, matter.pos, matter.dir);
    // matter.velo.mult(0.964);
    // commented this out cuz this was what made them move around way too much in midterms
    
    matter.dir.normalize();
    matter.dir.mult(matterSpd);
    // craig reynolds salute
    PVector steer = PVector.sub(matter.dir, matter.velo);
    steer.limit(steerPwr);
    matter.acc.add(steer);
    
    matter.velo.add(matter.acc);
    matter.velo.limit(matterSpd);
    matter.pos.add(matter.velo);
    matter.acc.mult(0);
    matter.renderCol(true); //put back wrapping
  }
  
  if (isLMBDown){holeWalker.pos = mousePos();}
  holeWalker.renderCol(true); //put back wrapping
}
