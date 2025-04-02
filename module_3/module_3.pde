int flushCnt = 300;

void setup()
{
  frameRate(60);
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{ 
  flushCnt++;
  if (flushCnt % 300 == 0){flushCnt=0;background(255);}
  
  float x = randomGaussian() * 200;
  float y = random(720/-2,720/2);
  
  float gaussian = randomGaussian();
  float standardDeviation = 6.9;
  float mean = 42.0;
  
  float size = standardDeviation * gaussian + mean;
  println(size);
  
  int randR = ceil(random(0,255));
  int randG = ceil(random(0,255));
  int randB = ceil(random(0,255));
  int randA = ceil(random(10,100));
  
  noStroke();
  fill(randR,randG,randB,randA);
  circle(x, y, size);
}
