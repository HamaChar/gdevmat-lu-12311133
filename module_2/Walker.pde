class Walker
{
  float x;
  float y;
  
  int r,g,b,a;
  
  void render()
  {
    fill(0,0,0,0);
    stroke(0,0,0,100);
    circle(x,y, 15);
    
    if (Math.abs(x) >= 1280/2)
    {
      x*=-1; 
    }
    if (Math.abs(y) >= 720/2)
    {
      y*=-1; 
    }
  }
  
  void renderCol(int _r, int _g, int _b, int _a)
  {
    r = _r; g = _g; b = _b; a = _a;
    fill(r,g,b,a);
    circle(x,y,15);
    
    println(ceil(x));
    println(ceil(y));
    if (Math.abs(x) >= 1280/2)
    {
      x*=-1; 
    }
    if (Math.abs(y) >= 720/2)
    {
      y*=-1; 
    }
  }
  
  void randomWalk()
  {
    int n = ceil(random(8)); // ceil cuz...ocd lol
    if (n == 1)
    {
      y+= 10;
    }
    else if (n == 2)
    {
      y-= 10;
    }
    else if (n == 3)
    {
      x+= 10;
    }
    else if (n == 4)
    {
      x -= 10;
    }
    else if (n == 5)
    {
      x+= 7.07;
      y+= 7.07;
    }
    else if (n == 6)
    {
      x+= 7.07;
      y-= 7.07;
    }
    else if (n == 7)
    {
      x-= 7.07;
      y+= 7.07;
    }
    else if (n == 8)
    {
      x -= 7.07;
      y -= 7.07;
    }
  }
  
  void randomWalkBiased(int biasUp, int biasDown, int biasRight, int biasLeft)
  {
    // biasWeights
    int w = ceil(random(biasUp + biasDown + biasRight + biasLeft)); // ceil cuz...ocd lol
    
    if (w <= biasUp)
    {
      y+= 10;
    }
    else if (w <= biasUp + biasDown)
    {
      y-= 10;
    }
    else if (w <= biasUp + biasDown + biasRight)
    {
      x+= 10;
    }
    else if (w <= biasUp + biasDown + biasRight + biasLeft)
    {
      x -= 10;
    }
  }
  
}
