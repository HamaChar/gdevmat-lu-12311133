void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x,y);
}

void drawLineToMouse(PVector _mouse, int lineW, int lineL, color col) {
  strokeWeight(lineW);
  stroke(col);
  PVector _mouseDupe = new PVector(_mouse.x,_mouse.y);
  _mouseDupe.normalize().mult(lineL);
  line(0, 0, _mouseDupe.x, _mouseDupe.y);
}
void drawLineToMouse(PVector _mouse, int lineW, int lineLO, int lineLT, color col) {
  strokeWeight(lineW);
  stroke(col);  
  PVector _mouseDupe = new PVector(_mouse.x,_mouse.y);
  PVector _mouseDupe2 = new PVector(_mouse.x,_mouse.y);
  _mouseDupe.normalize().mult(lineLO);
  _mouseDupe2.normalize().mult(lineLT);
  line(_mouseDupe.x, _mouseDupe.y, _mouseDupe2.x, _mouseDupe2.y);
}


void draw()
{
  background(69);
  
  PVector mouse = mousePos();
  
  color blk = color(0);
  color red = color(255,0,0);
  color wht = color(255);
  
  drawLineToMouse(mouse,21, 150,500,red);
  drawLineToMouse(mouse,21,0,-350,red);
  drawLineToMouse(mouse,7,-340,490,wht);
  drawLineToMouse(mouse,11,150,blk);
}
