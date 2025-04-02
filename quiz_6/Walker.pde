class Walker
{
  PVector pos = new PVector();
  PVector speed = new PVector(10, 10);
  
  int r,g,b,a;
  
  
  
  
  void render(boolean wrap)
  {
    circle(pos.x,pos.y, 15);
    if (wrap){
    if (Math.abs(pos.x) >= Window.windowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.windowHeight){pos.y*=-1;}
    }
  }
  void render()
  {
    circle(pos.x,pos.y, 15);
  }
  
  void renderCol(int _r, int _g, int _b, int _a, boolean wrap)
  {
    r = _r; g = _g; b = _b; a = _a; fill(r,g,b,a); stroke(0,100);
    circle(pos.x,pos.y,15);
    
    if (Math.abs(pos.x) >= Window.windowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.windowHeight){pos.y*=-1;}
    
    if (wrap){
    if (Math.abs(pos.x) >= Window.windowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.windowHeight){pos.y*=-1;}
    }
  }
  void renderCol(int _r, int _g, int _b, int _a)
  {
    r = _r; g = _g; b = _b; a = _a; fill(r,g,b,a); stroke(0,100);
    circle(pos.x,pos.y,15);
    
    if (Math.abs(pos.x) >= Window.windowWidth){pos.x*=-1;}
    if (Math.abs(pos.y) >= Window.windowHeight){pos.y*=-1;}
  }
}
