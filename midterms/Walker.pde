class Walker
{
  PVector pos = new PVector(0,0);
  PVector velo = new PVector(0,0); //velocity
  PVector dir = new PVector(0,0); //direction(no magnitude)
  PVector acc = new PVector();
  
  int r,g,b,a;
  float size;
  
  Walker(){}
  
  Walker(PVector _pos, PVector _dir)
  {
    pos = _pos;
    dir = _dir;
  }
  void setCol(int _h, int _s, int _b, int _a, boolean isHSB)
  {
    if (isHSB){
    colorMode(HSB, 360, 100, 100);
    
    color hsbCol = color(_h,_s,_b);
    
    colorMode(RGB, 255);
    
    r = int(red(hsbCol));
    g = int(green(hsbCol));
    b = int(blue(hsbCol));
    a = _a;
    }
  }
  void setCol(int _r, int _g, int _b, int _a)
  {
    r = _r;
    g = _g;
    b = _b;
    a = _a;
  }
  void setSize(float _size)
  {
    size = _size;
  }
  
  void render(float _size, boolean wrap)
  {
    circle(pos.x,pos.y, _size);
    if (wrap){
    if (Math.abs(pos.x) >= Window.windowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.windowHeight){pos.y*=-1;}
    }
  }
  void render(float _size)
  {
    circle(pos.x,pos.y, _size);
  }
  void render()
  {
    circle(pos.x,pos.y, size);
  }
  
  void renderCol(int _r, int _g, int _b, int _a, float _size, boolean wrap)
  {
    r = _r; g = _g; b = _b; a = _a; fill(r,g,b,a);
    circle(pos.x,pos.y,_size);
    
    if (wrap){
    if (Math.abs(pos.x) >= Window.windowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.windowHeight){pos.y*=-1;}
    }
  }
  void renderCol(int _r, int _g, int _b, int _a, float _size)
  {
    r = _r; g = _g; b = _b; a = _a; fill(r,g,b,a);
    circle(pos.x,pos.y,_size);
    
  }
  void renderCol(float _size)
  {
    fill(r,g,b,a);
    circle(pos.x,pos.y,_size);
    
  }
  void renderCol()
  {
    fill(r,g,b,a);
    circle(pos.x,pos.y, size);
    
  }
}
