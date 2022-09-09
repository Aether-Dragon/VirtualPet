import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
int bgcolorb = 255;
float rad = 0;
boolean isClockwise = true;

public void setup() {
  size(400, 400);
  arduino = new Arduino(this, Arduino.list()[1], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
}

public void draw() {
  fill(200, 230, 249, 50);
  noStroke();
  rect(0,0, 400, 400);
  if (arduino.analogRead(3) == 0) {
    if (arduino.analogRead(1) > 1) {
      bgcolorb++;
     } else if (arduino.analogRead(6) > 1) {
      bgcolorb--;
     }
  } else if (arduino.analogRead(3) > 1) {
    if (arduino.analogRead(1) > 1) {
      isClockwise = true;
     } else if (arduino.analogRead(6) > 1) {
      isClockwise = false;
     }
  }
  pushMatrix();
  translate(200,200);
  rotate(rad);
  stroke(7,61,95);
  fill(13, 214, bgcolorb, 150);
  ellipse(0, -100, 20, 150);
  popMatrix();
  if (isClockwise) {
    rad += PI/36;
  } else {
    rad -= PI/36;
  }
  for(int i = 0; i < 16; i++)
    System.out.print(i+" "+arduino.analogRead(i) + "\t");
  System.out.println();
}
