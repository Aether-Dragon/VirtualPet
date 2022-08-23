void setup()
{
  size(600,400);
  
}

void draw()
{
  background(255,255,255);
  text(mouseX + ", " + mouseY, 10, 10);
  fill(0,0,0);
  //ellipse(150,100,80,90);
  quad(110, 80, 115, 55, 185, 55, 190, 80);
  triangle(112, 70, 105, 40, 140, 55); //left ear
  triangle(160, 60, 185, 35, 190, 80); //right ear
  quad(110, 80, 120, 105, 180, 105, 190, 80);
  quad(120,105, 135,120,160,120,180,105);
}
