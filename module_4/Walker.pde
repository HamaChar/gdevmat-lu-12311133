class Walker
{
  float x;
  float y;
  float tx = 0, ty = 111*555;
  
  float r,g,b,a;
  
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
  
  void perlinWalk(int speed)
  {
    x = map(noise(tx), 0, 1, 1280/-2, 1280/2);
    y = map(noise(ty), 0, 1, 720/-2, 720/2);
    
    
    tx += 0.01f * speed / 10;
    ty += 0.01f * speed / 10;
  }
  
  void renderCol(float _r, float _g, float _b, float _a, float _size)
  {
    r = _r; g = _g; b = _b; a = _a;
    fill(r,g,b,a);
    circle(x,y,_size);
    
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
}
