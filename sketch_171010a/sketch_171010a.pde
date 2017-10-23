/* 
List of drawable pologons from 
Mathematical Excursions to the World's Great Buildings
Alexander J. Hahn
https://www.amazon.co.uk/Mathematical-Excursions-Worlds-Great-Buildings/dp/0691145202
*/ 

int w = 800;
int h = 600;

int[] valid = {3, 4, 5, 6, 8, 10, 
      12, 15, 16, 17, 20, 24, 30, 
      32, 34, 40, 48, 51, 60, 64, 
      68, 80, 85, 96, 102, 120, 128, 
      136, 160, 170, 192, 204, 240, 
      255, 256, 257, 272, 320, 340, 
      384, 408, 480, 510, 512, 514, 
      544, 640, 680, 768, 771, 816, 960};

void setup() {
  size(800, 600);
  noLoop();
}

void draw() {
  background(255);
  smooth();
  int numGonsX = 32;
  int numGonsY = 20;
  println("Drawable polygons up to " + (numGonsX * numGonsY));
  drawGrid(numGonsX, numGonsY);

  int c=1;
  int n=1;
  int numDrawable=0;
  
  float xWidth = w / numGonsX;
  float yHeight = h / numGonsY;

  for (int j=0; j< numGonsY; j++) {
    for (int i=0; i<numGonsX; i++) {
        if (drawable(n)) {
          numDrawable++;
          float xO = i*xWidth + (xWidth/2);
          float yO = j*yHeight + (yHeight/2);
          if(n>2){
          float r = w / numGonsX / 4;
            for (int s=0; s<n; s++) {
              float p1x = cos(s * 2 * PI/n) * r;
              float p1y = sin(s * 2 * PI/n) * r;
              float p2x = cos((s+1) * 2 * PI/n) * r;
              float p2y = sin((s+1) * 2 * PI/n) * r;
              line(xO+p1x, yO+p1y, xO+p2x, yO+p2y);
            }
          }
        }
      n++;

    }
  }
  println("Number of drawable polygons " + numDrawable);
   save("drawable-polygons.png");

}

void drawGrid(int numX, int numY) {
  float xWidth = w / numX;
  float yHeight = h / numY;
  stroke(244);
  for (int i=0; i<= numX; i++) {
    line(i*xWidth, 0, i*xWidth, h);
  }

  for (int i=0; i< numY; i++) {
    line(0, i*yHeight, w, i*yHeight);
  }
  stroke(0);
}


boolean drawable(int candidate) {
  boolean inList = false;
  for (int l=0; l<valid.length; l++) {
    if (valid[l] == candidate) {
      inList = true;
    }
  }
  return inList;
}