
float get_rect_area(float[][]rect) {
  float area = 0;
  area = (rect[1][0] - rect[0][0])*(rect[3][1] - rect[0][1]);
  return abs(area);
}

float[][][] divideRectanges(float[][]rect, float randomNum, float minArea) {

  if (get_rect_area(rect) < minArea) {
    return new float[][][]{rect};
  } else {

    float off1 = 0.5 + random(-randomNum/2, randomNum/2);
    float off2 = 0.5 + random(-randomNum/2, randomNum/2);

    float[] a = rect[0];
    float[] b = rect[1];
    float[] c = rect[2];
    float[] d = rect[3];

    float[] ab = new float[]{a[0] + (b[0]-a[0])*off1, a[1]};
    float[] bc = new float[]{b[0], b[1] + (c[1]-b[1])*off2};
    float[] cd = new float[]{ab[0], c[1]};
    float[] da = new float[]{a[0], bc[1]};
    float[] center = new float[]{ab[0], bc[1]};

    float[][][] div_rect = new float[4][4][2];
    div_rect[0] = new float[][]{a, ab, center, da};
    div_rect[1] = new float[][]{ab, b, bc, center};
    div_rect[2] = new float[][]{center, bc, c, cd};
    div_rect[3] = new float[][]{da, center, cd, d};
    return div_rect;
  }
}
