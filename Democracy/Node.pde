class Node {
  
  float rad;
  ArrayList<Node> pos;
  ArrayList<Node> neg;
  color c;
  float x;
  float y;
  boolean unlocked;
  String name;
  int value;
  //^whatever the node is supposed to represent
  
  Node(float _r, String n, int i) {
    pos = new ArrayList<Node>();
    neg = new ArrayList<Node>();
    c = color(135,206,250);
    x = (float)Math.random() * width;
    y = (float)Math.random() * height;
    rad= _r;//initial size
    unlocked = false;
    name = n;
    value = i;
  }
  
  
  color getColor(){
   return c;     
  }
  
  void set(int newValue) {
    value = newValue;
  }
  
  int get() {
    return value;
  }
  
  void draw() {
    fill(c);
    stroke(c);
    ellipse(x, y, rad, rad);
    fill(0);
    stroke(0);
    text(name, x, y);
  }
  
  void addP(Node n) {
    pos.add(n);
  }
  
  void addN(Node n) {
    neg.add(n);
  } 
  
  void grow(float s) {
    rad = rad + s;
  }
  
  void shrink(float s) {
    if (rad - s > 0) {
      rad = rad - s;
    }
  }
  
  void affect(boolean b, float s) {
    if (b) {
      for (Node n : pos) {
        n.grow(s);
      }
      for (Node n : neg) {
        n.shrink(s);
      }
    }
    else {
      for (Node n : neg) {
        n.grow(s);
      }
      for (Node n : pos) {
        n.shrink(s);
      }
    }
  }
    
}//end of class Node