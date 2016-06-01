class Node {
  
  int size;
  ArrayList<Node> pos;
  ArrayList<Node> neg;
  
  Node() {
    size = 100;
    pos = new ArrayList<Node>();
    neg = new ArrayList<Node>();
  }
  
  void addP(Node n) {
    pos.add(n);
  }
  
  void addN(Node n) {
    neg.add(n);
  } 
  
  void grow(int s) {
    size = size + s;
  }
  
  void shrink(int s) {
    size = size - s;
  }
  
  void affect(boolean b) {
    if (b) {
      for (Node n : pos) {
        n.grow();
      }
    }
    else {
      for (Node n : neg) {
        n.shrink();
      }
    }
  }
    
}//end of class Node