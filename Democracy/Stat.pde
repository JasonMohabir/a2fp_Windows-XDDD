class Stat {
  
  int polcap;
  
  Stat() {
    polcap = 50;
  }
  
  void resetPolcap(){
    polcap = 50;
  }
  
  void updatePolCap(int p){
    polcap = p;
  }
  
  int getPolcap(){
    return polcap;
  }
  
 }//end of class Stat