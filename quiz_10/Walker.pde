class Walker
{
  PVector pos = new PVector(0,0);
  PVector velo = new PVector(0,0); //velocity
  PVector dir = new PVector(0,0); //direction(no magnitude)
  PVector acc = new PVector();
  
  float maxVelo = 10;
  float scale = 15;
  float mass = 1;
  
  int r,g,b,a;
  
  // constructor
  Walker(){}
  Walker(PVector _pos)
  {
    this.pos = _pos;
  }
  void setQuant(float _scale, float _mass)
  {
    this.scale = _scale;
    this.mass = _mass;
  }
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acc.add(f);
  }
  void update()
  {
    this.velo.normalize(this.dir);
    this.velo.add(this.acc);
    this.velo.limit(maxVelo);
    this.pos.add(this.velo);
    this.acc.mult(0);
  }
  
  
  
  
  
  
  
  
  
  void applyInertia(boolean _flr, boolean _walls, boolean _ceil)
  {
    if (_flr)
    {
      if (this.pos.y <= Window.bottom)
      {
        this.pos.y = Window.bottom;
        this.velo.y *= -1;
      }
    }
    if (_walls)
    {
      if (this.pos.x <= Window.left)
      { 
        this.pos.x = Window.left;
        this.velo.x *= -1;
      }
      if (this.pos.x >= Window.right)
      {
        this.pos.x = Window.right;
        this.velo.x *= -1;
      }
    }
    if (_ceil)
    {
      if (this.pos.y >= Window.top)
      {
        
        this.pos.y = Window.top;
        this.velo.y *= -1;
      }
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  // SETCOL
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
  void setScale(float _scale)
  {
    scale = _scale;
  }
  
  
  // RENDER
  void render(float _scale, boolean wrap)
  {
    circle(pos.x,pos.y, _scale);
    if (wrap){
    if (Math.abs(pos.x) >= Window.WindowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.WindowHeight){pos.y*=-1;}
    }
  }
  void render(float _scale)
  {
    circle(pos.x,pos.y, _scale);
  }
  void render(boolean wrap)
  {
    circle(pos.x,pos.y, scale);
    if (wrap){
    if (Math.abs(pos.x) >= Window.WindowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.WindowHeight){pos.y*=-1;}
    }
  }
  void render()
  {
    circle(pos.x,pos.y, scale);
  }
  
  
  
  
  void renderCol(int _r, int _g, int _b, int _a, float _scale, boolean wrap)
  {
    r = _r; g = _g; b = _b; a = _a; fill(r,g,b,a);
    circle(pos.x,pos.y,_scale);
    
    if (wrap){
    if (Math.abs(pos.x) >= Window.WindowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.WindowHeight){pos.y*=-1;}
    }
  }
  void renderCol(int _r, int _g, int _b, int _a, float _scale)
  {
    r = _r; g = _g; b = _b; a = _a; fill(r,g,b,a);
    circle(pos.x,pos.y,_scale);
  }
  void renderCol(float _scale)
  {
    fill(r,g,b,a);
    circle(pos.x,pos.y,_scale);
  }
  void renderCol()
  {
    fill(r,g,b,a);
    circle(pos.x,pos.y, scale);
  }
  void renderCol(boolean wrap)
  {
    fill(r,g,b,a);
    circle(pos.x,pos.y, scale);
    if (wrap){
    if (Math.abs(pos.x) >= Window.WindowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.WindowHeight){pos.y*=-1;}
    } //put wrapping
  }
}
