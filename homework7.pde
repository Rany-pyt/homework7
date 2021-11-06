ArrayList<float[][]> rectanges = new ArrayList<float[][]>();
float randomNum = 0.8;

void setup() {
  size(1000, 800);
  startRectange();
  frameRate(2);
}

void draw() {
  background(0);
  updateRectanges();
  for (float[][] temp_rect : rectanges) {
    drawRectanges(temp_rect);
  }
}


void startRectange() {
  float[] point0 = new float[]{50, 100};
  float[] point1 = new float[]{950, 100};
  float[] point2 = new float[]{950, 700};
  float[] point3 = new float[]{50, 700};


  float[][] rectange0 = new float[][]{point0, point1, point2, point3};
  rectanges.add(rectange0);
}


void drawRectanges(float[][] rect) {
  strokeWeight(1);
  stroke(random(130), random(130), random(150, 255), random(50, 255));
  for (int i=0; i<rect.length; i++) {
    int i_n = (i+1) % rect.length;
    line(rect[i][0], rect[i][1], rect[i_n][0], rect[i_n][1]);
  }
}



void updateRectanges() {
  ArrayList<float[][]>div_rectanges = new ArrayList<float[][]>();
  for (float[][]temp_rect : rectanges) {
    float[][][]vids = divideRectanges(temp_rect, randomNum, 10);
    for (int i=0; i<vids.length; i++) {
      div_rectanges.add(vids[i]);
    }
  }
  rectanges.clear();
  rectanges.addAll(div_rectanges);
}
