class Node {
  
  float rad;
  ArrayList<Node> pos;
  ArrayList<Node> neg;
  color c;
  float x;
  float y;
  boolean unlocked;
  
  Node(float _x, float _y, float _r) {
    pos = new ArrayList<Node>();
    neg = new ArrayList<Node>();
    c = color(135,206,250);
    x = _x;
    y = _y;
    rad = _r;//initial size
    unlocked = false;
  }
  
  void draw() {
    fill(c);
    stroke(c);
    ellipse(x, y, rad, rad);
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