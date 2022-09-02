import processing.serial.*;
import cc.arduino.*;
import org.firmata.*;
Arduino arduino;
int input;
int x;
int y;
int angle;

public void setup()
{
  size(350,300);
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  
}

public void draw()
{
  background(255,255,255);
  text(mouseX + ", " + mouseY, 10, 10);
  input = arduino.analogRead(5);
  
  //head
  fill(0,0,0);
  quad(110, 80, 115, 55, 185, 55, 190, 80);
  quad(110, 80, 120, 105, 180, 105, 190, 80);
  quad(120, 105, 135, 120, 160, 120, 180, 105);
  x = input*4/38;
  y = arduino.analogRead(5)*4/51;
  System.out.println(x);
  triangle(112, 70, 90+x, 55-y, 140, 55); //left ear
  triangle(160, 60, 210-x, 55-y, 190, 80); //right ear
  
  // eyes
  if (x < 12) {
    stroke(24, 228, 234);
    strokeWeight(2);
    noFill();
    arc(135, 80, 7, 7, PI, TWO_PI);
    arc(165, 80, 7, 7, PI, TWO_PI);
  } else {
    fill(24, 228, 234);
    ellipse(135, 80, 7, 7);
    ellipse(165, 80, 7, 7);     
   }
  stroke(0,0,0);
  strokeWeight(1);
  fill(255, 201, 208);
  triangle(145, 90, 155, 90, 150, 95);
  
  //body
  noStroke();
  fill(0,0,0);
  quad(170, 110, 215, 165, 205, 235, 160, 235);
  fill(10,10,10);
  quad(125,105,115,160, 125,215, 170, 105);
  quad(175, 110, 185, 155, 170, 215, 135, 110);
  quad(120, 155, 180, 155, 170, 240, 125, 240); 
  quad(130, 225, 120, 230, 115, 240, 140, 240);
  
  //tail
  fill(0,0,0);
  quad(205, 230, 205, 210, 265, 240, 250, 245);
  angle = arduino.analogRead(5)*4/11;
  pushMatrix();
  translate(255, 240);
  rotate(radians(-angle));
  fill(5,5,5);
  //quad(265, 240, 250, 240, 230, 275, 240, 270);
  quad(10-(angle/18), 0, -5, 0-(angle/15), -25, 35, -15, 30);
  popMatrix();
}
