//===========NODES===========
Node _welfare = new Node(300, 300, 50);
Node _poverty = new Node (500, 300, 50);

void setup() {
  size(800,600);
  _welfare.addN(_poverty);
  _poverty.addN(_welfare);
}

void draw() {
  background(0);
  _welfare.draw();
  _poverty.draw();
  
  mousePressed();
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