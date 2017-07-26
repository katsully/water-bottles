PImage img;
PImage flag;

int stripeHeight;
int limit = 136;
int stripeCounter = 13-1;
boolean secondRow = false;
float offset = 0.0;

int stripes = 13;
int subStripes = 2;
int[][] bottleCounter = new int[stripes][subStripes];

void setup() {
  size(1920, 1080);
  background(0);
  stripeHeight = int(height*.935/13);
  for (int i=0; i< stripes; i++) {
    bottleCounter[i][0] = 0;
    bottleCounter[i][1] = 1;
  }

  //flag = loadImage("flagSample.png");
  img = loadImage("waterBottle.png");
  img.resize(0, (stripeHeight-5)/2);
}

void draw() {
  background(0, 0, 0, 0);

  //image(flag, 0, 0);

  for (int i=12; i>=stripeCounter; i--) {
    if (i != 12) {
      offset += 1.05;
    } else {
      offset = 0;
    }
    for (int j=0; j<bottleCounter[i][0]; j++) {
      image(img, width-(j*img.width), (i+1)*stripeHeight+img.height+7-offset);
    }
    for (int k=0; k<bottleCounter[i][1]; k++) {
      image(img, width-(k*img.width), (i+1)*stripeHeight+7-offset);
    }
  }

  if (secondRow) {
    if (bottleCounter[stripeCounter][1] < limit) {
      bottleCounter[stripeCounter][1]++;
    } else {
      if (stripeCounter == 0) {
        noLoop();
      }
      stripeCounter--;
      if (stripeCounter < 7) {
        limit = 78;
      } 
      secondRow = false;
    }
  } else {
    if (bottleCounter[stripeCounter][0] < limit) {
      bottleCounter[stripeCounter][0]++;
    } else {
      secondRow = true;
    }
  }
}