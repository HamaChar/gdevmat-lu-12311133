float time = 0;

float sineFreq = 1.0f;
float sineAmp = 1.0f;

void setup()
{
  frameRate(60);
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0);
  time ++;
  
  drawCartesianPlane();
  drawLinearFunction(-5, 30);
  drawQuadraticFunction(1, -15, -3);


  drawSine(sineFreq, sineAmp);
}

void keyPressed() {
  if (keyCode == LEFT) {
    sineFreq -= 0.03f;
  }
  if (keyCode == UP) {
    sineAmp += 2.5f;
  }
  if (keyCode == RIGHT) {
    sineFreq += 0.03f;
  }
  if (keyCode == DOWN) {
    sineAmp -= 2.5f;
  }
}



void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, 300, 0, -300);

  for (int i = -300; i <= 300; i += 25)
  {
    line(i, -3, i, 3);
    line(-3, i, 3, i);
  }
}

void drawLinearFunction(int a, int b)
{
  color c = color(200, 40, 200);
  fill(c);
  noStroke();

  // Linaer Function
  // f(x) = ax + b

  for (int x = -200; x <= 200; x++)
  {
    circle(x, x * a + b, 5);
  }
}

void drawQuadraticFunction(int a, int b, int c)
{
  color col = color(255, 255, 0);
  fill(col);
  stroke(col);

  // Quadratic Functijno
  // f(x) = ax^2 + bx + c

  for (float x = -300; x <= 300; x+=0.1f)
  {

    // f(x) = x^2 + 2x - 5
    // 
    circle(x, (float)Math.pow(x, 2) * a + (x * b) + c, 5);
  }
}

void drawSine(float freq, float amp) {
  color c = color(255, 150, 0);
  fill(c);
  stroke(c);

  // y = sin(x)
  for (float x = -250; x <= 250; x+=.1f) {
    circle(x, sin(time + x * freq) * amp , 5);
  }
}

/*
void drawCircle()
 {
 color c = color(255, 180, 50);
 fill(c);
 stroke(c);
 
 float r = 50;
 
 for (int x = 0; x <= 360; x++){
 circle((float)Math.cos(x) * r, (float)Math.sin(x) * r, 5);
 }
 }
 */
