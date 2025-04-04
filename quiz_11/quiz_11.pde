//  F = ( ( G * m1 * m2 ) / displacement ) * direction
ArrayList<Walker> gravWalkers = new ArrayList<Walker>();

float scaleRep = 7;
float mass = 10;
float scale = 10;
int massMax = 30;
int densityMax = 10;

void setup()
{
  strokeWeight(3);
  frameRate(60);
  background(255);
  textAlign(CENTER, CENTER);
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 10; i++)
  {
    Walker gravWalk = new Walker();
    int _h = int(random(360));
    int _s = int(random(25,40));
    int _b = int(random(80,100));
    gravWalk.setCol(_h,_s,_b,250,true);
    
    gravWalk.mass = random(1, massMax);
    gravWalk.density = random(1, densityMax);
    float x = random(-Window.WindowWidth, Window.WindowWidth);
    float y = random(-Window.WindowHeight, Window.WindowHeight);
    
    gravWalk.density = densityMax;
    scale = scaleRep * gravWalk.calculatePlanetRadius(gravWalk);
    gravWalk.setScale(scale);
    gravWalk.pos = new PVector(x,y);
    gravWalkers.add(gravWalk);
  }
}

void draw()
{  
  background(255);
  
  fill(200);
  scale(1, -1);
  textSize(70);
  text(gravWalkers.size(), 0, 60);
  textSize(32);
  text("Click screen to apply randomness and bounce", 0, -200);
  text("Press ↑ or ↓ to vary density randomness", 0, -240);
  text("Press ← or → to vary mass randomness", 0, -280);
  text("Press A or D to vary ball count!", 0, -320);
  textSize(16);
  text("Press W or S to vary Scale Representation", 0, 330);
  
  scale(1, 1);
  
  for (Walker celestialObj : gravWalkers)
  {
    for (Walker otherCelObj : gravWalkers)
    {
      if (celestialObj != otherCelObj){
        
        PVector forceApplied = otherCelObj.calculateAttraction(celestialObj);
        
        celestialObj.applyForce(forceApplied);
        celestialObj.applyInertia(true,true,true);
        celestialObj.applyFriction(0.005f, 1);
        celestialObj.update();
      }
    }
    
    celestialObj.renderCol();
  }
}  



void mousePressed()
{
  for (Walker celestialObj : gravWalkers)
  {
    celestialObj.mass = random(1,massMax);
    celestialObj.density = densityMax;
    scale = scaleRep * celestialObj.calculatePlanetRadius(celestialObj);
    celestialObj.setScale(scale);
    
    celestialObj.update();
    celestialObj.velo.mult(1.3);
    int _h = int(random(360));
    int _s = int(random(25,40));
    int _b = int(random(80,100)); 
    celestialObj.setCol(_h,_s,_b,250,true);
  }
}

void keyReleased()
{
  
  
  if (keyCode == 68)
  {
    Walker gravWalk = new Walker();
    int _h = int(random(360));
    int _s = int(random(25,40));
    int _b = int(random(80,100));
    gravWalk.setCol(_h,_s,_b,250,true);
    
    gravWalk.mass = random(1, massMax);
    gravWalk.density = random(1, densityMax);
    float x = random(-Window.WindowWidth, Window.WindowWidth);
    float y = random(-Window.WindowHeight, Window.WindowHeight);
    
    gravWalk.density = densityMax;
    scale = scaleRep * gravWalk.calculatePlanetRadius(gravWalk);
    gravWalk.setScale(scale);
    gravWalk.pos = new PVector(x,y);
    gravWalkers.add(gravWalk);
  }
  
  if (keyCode == 65)
  {
    if (gravWalkers.size() > 1) {gravWalkers.remove(0);}
  }
  
  
  
  if (keyCode == LEFT){
    if(massMax > 2) {massMax -= 2;}
    println("Mass Maximum:" + massMax);
    for (Walker celestialObj : gravWalkers)
    {
      
      scale = scaleRep * celestialObj.calculatePlanetRadius(celestialObj);
      celestialObj.setScale(scale);
      
      celestialObj.update();
    }
  }
  if (keyCode == RIGHT)
  {
    massMax += 2;
    println("Mass Maximum:" + massMax);
    for (Walker celestialObj : gravWalkers)
    {
      scale = scaleRep * celestialObj.calculatePlanetRadius(celestialObj);
      celestialObj.setScale(scale);
      
      celestialObj.update();
    }
  }
  if (keyCode == UP)
  {
    densityMax += 2;
    println("Density Maximum:" + densityMax);
    for (Walker celestialObj : gravWalkers)
    {
      scale = scaleRep * celestialObj.calculatePlanetRadius(celestialObj);
      celestialObj.setScale(scale);
      
      celestialObj.update();
    }
  }
  if (keyCode == DOWN)
  {
    if (densityMax > 2) {densityMax -= 2;}
    println("Density Maximum:" + densityMax);
    for (Walker celestialObj : gravWalkers)
    {
      scale = scaleRep * celestialObj.calculatePlanetRadius(celestialObj);
      celestialObj.setScale(scale);
      
      celestialObj.update();
    }
  }
  if (keyCode == 87)
  {
    scaleRep*=1.12f;
    println("Scale Representation:" + scaleRep);
    for (Walker obj : gravWalkers)
    {
      scale = scaleRep * obj.calculatePlanetRadius(obj);
      obj.scale = scale;
    }
  }
  if (keyCode == 83)
  {
    if (scaleRep > 1) {scaleRep*=0.88f;}
    println("Scale Representation:" + scaleRep);
    for (Walker obj : gravWalkers)
    {
      scale = scaleRep * obj.calculatePlanetRadius(obj);
      obj.scale = scale;
    }
  }
}
