//==========Stages of Game=======
int state = 0;
  //0-->opening
  //1-->overview screen
  //2-->

//===========NODES===========
Node _welfare = new Node(300, 300, 50, "Welfare");
Node _poverty = new Node (500, 300, 50, "Poverty");

final int width = 1025;
final int height = 518;

void setup() {
  size(1025, 518);
  _welfare.addN(_poverty);
  _poverty.addN(_welfare);
}

void draw() {
  if (state == 0) {//opening
    background(loadImage("Map.png"));
    fill(128, 128,128, 225);
    stroke(128, 128, 128, 225);
    rect(width/4, height/4, width/2, height/2);
    fill(0, 0, 255);
    stroke(0, 0, 255);
    textFont(createFont("AmericanTypewriter-CondensedBold.ttf", 32));
    text("DEMOKRATIA", width/2, height/3);
    textAlign(CENTER);
    textSize(30);
String[] fontList = PFont.list();
printArray(fontList);
  }
  else {
  background(0);
  _welfare.draw();
  _poverty.draw();
  
  mousePressed();
  }
}

void mouseClicked() {
  if (mouseX <= _welfare.x + _welfare.rad && mouseX >= _welfare.x - _welfare.rad
      && mouseY <= _welfare.y + _welfare.rad && mouseY >= _welfare.y - _welfare.rad) {
    _welfare.grow(2);
    _welfare.affect(true, 2);
  }
  if (mouseX <= _poverty.x + _poverty.rad && mouseX >= _poverty.x - _poverty.rad 
    && mouseY <= _poverty.y + _poverty.rad && mouseY >= _poverty.y - _poverty.rad) {
    _poverty.grow(2);
    _poverty.affect(true, 2);
  }
}