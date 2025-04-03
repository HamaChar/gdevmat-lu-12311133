class Liquid
{
  float x, y;
  float horizon, depth;
  float cd;
  
  Liquid(float x, float y, float hori, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = hori;
    this.depth = depth;
    this.cd = cd;
  }
  
  void render()
  {
    fill(28, 120, 186);
    noStroke();
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  boolean isCollidingWith(Walker walker)
  {
    PVector pos = walker.pos;
    return pos.x > this.x - this.horizon &&
          pos.x < this.x + this.horizon &&
          pos.y < this.y;
  }
  
  PVector calculateDragForce(Walker walker)
  {
    float speed = walker.velo.mag();
    float dragMag = this.cd * speed * speed;
    
    PVector dragForce = walker.velo.copy().mult(-1);
    
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }
}
