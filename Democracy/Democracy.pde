//import java.util.HashMap.Node;
import java.util.Collection;
//Stages of Game
// 0 - Opening screen
// 1 - Select country
// 2 - Game screen
// 3 - Node Selected

int state;
int turn;

final int width = 1025;
final int height = 518;
String myText = "Back up! You need a name!";

String name;
String country;
PImage flag;
Node curr;

//===========TRACKER NODES===========
//starting stats set at 50
//generally measures of how the country is doing


int _polcap = 50;

//Node _polcap = new Node(50, "Political Capital", 24, color(135,206,250)); //the currency we use to enact action
Node _income = new Node(50, "Total Income", 50, color(135,206,249));
Node _expenditure = new Node (50, "Total Expenditure", 50, color(135,206,248));
Node _totalhappiness = new Node(50, "Overall Happiness", 50, color(135,206,247));
Node _poverty = new Node(50, "Poverty", 50, color(135,206,246));
Node _health = new Node(50, "Health", 50, color(135,206,245));
Node _crime = new Node(50, "Crime", 50, color(135,206,244));
Node _oildemand = new Node(50, "Oil Demand", 50, color(135,206,243));
Node _oilprice = new Node(50, "Oil Price", 50, color(135,206,242));
Node _oilsupply = new Node(50, "Oil Supply", 50, color(135,206,241));
Node _unemployment = new Node(50, "Unemployment", 50, color(135,206,240));
Node _globaleconomy = new Node(50, "Global Economy", 50, color(135,206,239));
Node _education = new Node(50, "Education", 50, color(135,206,238));
Node _environment = new Node(50, "The Environment", 50, color(135,206,237));
Node _vehicleusage = new Node(50, "Vehicle Usage", 50, color(135,206,236));
Node _gdp = new Node(50, "GDP", 50, color(135,206,235));
Node _technology = new Node(50, "Technology", 50, color(135,206,234));
Node[] _collection = {_income, _expenditure, _totalhappiness, _poverty, _health, _crime, _oildemand, _oilprice, _oilsupply, _unemployment, _globaleconomy, _education, _environment, _vehicleusage, _gdp, _technology};

Stat stat;
/*
//==========POLICY NODES=========
 Node _incometax = new Node(???, 300, 50, "Income Tax");
 Node _salestax = new Node(???, 300, 50, "Sales Tax");
 Node _roadbuilding = new Node(???, 300, 50, "Road Building");
 Node _publictransport = new Node(???, 300, 50, "Subsidized Public Transport");
 Node _policeforce = new Node(???, 300, 50, "Police Force");
 Node _publicschools = new Node(???, 300, 50, "Public Schools");
 Node _cleanenergysubsidies = new Node(???, 300, 50, "Clean Energy Subsidies");
 Node _statepensions = new Node(???, 300, 50, "State Pensions");
 Node _statehousing = new Node(???, 300, 50, "State Housing");
 Node _statehealthcare = new Node(???, 300, 50, "State Healthcare");
 Node _militaryspending = new Node(???, 300, 50, "Military Spending");
 */


void setup() {
  size(1025, 518);
  //noStroke();
  //smooth();
  state = 0;
  stat = new Stat();
}

void draw() {
  
  PFont georgia;
  georgia = createFont("Georgia",30);
  textFont(georgia);
  
  switch(state) {
  case 0: 
    drawScreenZero(); 
    break;
  case 1: 
    drawScreenOne(); 
    break;
  case 2: 
    drawScreenTwo(); 
    break;
  case 3:
    drawScreenThree(curr);
    break;
  case 4:
    drawScreenFour();
    break;
  default: 
    background(0); 
    break;
  }
}

void drawScreenZero() {
  background(loadImage("Images/Map.png"));
  fill(128, 128, 128, 225);
  stroke(128, 128, 128, 225);
  rect(width/4, height/4, width/2, height/2);

  fill(0, 0, 255);
  stroke(0, 0, 255);
  textAlign(CENTER);
  textSize(30);
  text("DEMOKRATIA", width/2, height/3);

  textSize(20);
  text("BY THE PEOPLE, FOR THE PEOPLE", width/2, height/3 + 30);

  textSize(20);
  text("What is your name?", width/3 + 15, height/2);
  textAlign(LEFT);

  fill(255, 255, 255);
  stroke(255, 255, 255);
  rect(width/3 + 120, height/2 - 20, 250, 25);
  fill(0);
  stroke(0);
  text(myText, width/3 + 120, height/2);

  fill(0, 0, 255, 175);
  stroke(0, 0, 255, 175);
  rect(width/3 + 120, height/2 +40, 100, 50);

  fill(255, 255, 255);
  stroke(255, 255, 255);
  textAlign(CENTER);
  text("ENTER", width/3 + 130, height/2 + 50, 75, 50);

  if (mouseX >= width/3 +120 && mouseX <= width/3 +205 && mouseY >= height/2 + 50 && mouseY <= height/2 + 100) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void drawScreenOne() {
  background(loadImage("Images/Map.png"));

  fill(128, 128, 128, 225);
  stroke(128, 128, 128, 225);
  rect(0, 0, width, height/8-1);

  fill(0, 0, 255);  
  stroke(255, 255, 255);
  textSize(30);
  textAlign(CENTER);
  text("Choose a Country", width/2, height/12);

  fill(128, 128, 128, 225);
  stroke(128, 128, 128, 225);
  rect(width/7 - 10, height/4 - 10, width/7 + 20, height/3 + 15);
  rect(3*width/7 - 10, height/4 - 10, width/7 + 20, height/3 + 15);
  rect(5*width/7 - 10, height/4 - 10, width/7 + 20, height/3 + 15);
  rect(3*width/7 - 10, 2*height/3 - 20, width/7 + 20, height/3 + 15);
  
  image(loadImage("Images/Oz.png"), width/7, height/4, width/7, width/7);
  image(loadImage("Images/Panem.png"), 3*width/7, height/4, width/7, width/7);  
  image(loadImage("Images/Atlantis.png"), 5*width/7, height/4, width/7, width/7);    
  image(loadImage("Images/Borduria.png"), 3*width/7, 3*height/4 - 50, width/7, width/7);

  textSize(20);
  fill(0, 0, 0);
  stroke(255, 255, 255);
  text("The Land of Oz", width/7 + 72, height/2 + 40);
  text("Panem", 3*width/7 + 72, height/2 + 40);
  text("Atlantis", 5*width/7 + 72, height/2 +40);
  text("Borduria", 3*width/7 + 72, 3*height/4 + 115);
  
  if (mouseX >= width/7 && mouseY >= height/4 && mouseX <= 2*width/7 && mouseY <= height/4 + width/7) {
    cursor(HAND);
  }
  else if (mouseX >= 3*width/7 && mouseY >=  height/4 && mouseX <= 4*width/7 && mouseY <= height/4 + width/7) {
    cursor(HAND);
  }
  else if (mouseX >= 5*width/7 && mouseY >= height/4 && mouseX <= 6*width/7 && mouseY <= height/4 + width/7) {
    cursor(HAND);
  }
  else if (mouseX >= 3*width/7 && mouseY >= 3*height/4 - 50 && mouseX <= 4*width/7 && mouseY <= 3*height/4 - 50 + width/7) {
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }

}

void drawScreenTwo() {
  background(loadImage("Images/Map.png"));
  fill(128, 128, 128, 225);
  stroke(128, 128, 128, 225);
  rect(0,0, width, height);
  
  image(flag, 0, height - 100, 200, 100);
  fill(0,0,0);
  stroke(0,0,0);
  rect(0, height - 125, 200, 25);

  fill(0, 0, 0);
  stroke(255,255,255);
  textSize(10);
  text("Political Capital: " + _polcap, 50, 50);
  text("STAT: " + stat.getPolcap(), 80, 80);
  
  
  fill(255, 255, 255);
  stroke(255,255,255);
  textSize(10);
  text("The " + name + " Administration of " + country, 100, height - 110);
  
  for (int i = 0; i < _collection.length; i++) {
    _collection[i].x = (i%5 * width / 6) + width / 6;
    _collection[i].y = (i/4 * height / 4) + 50;
    _collection[i].draw();
  }
  
    for (Node n: _collection){
      if (n.getColor() == get(mouseX, mouseY)){
        cursor(HAND);
        break;
      }
      else {
        cursor(ARROW);
      }
    }
    
  fill(255, 255, 255);
  stroke(255, 255, 255);
  textAlign(CENTER);
  textSize(10);
  text("NEXT TURN", width/3 + 130, height/2 + 50, 75, 50);
  if (mouseX >= width/3 +130 && mouseX <= width/3 +205 && mouseY >= height/2 + 50 && mouseY <= height/2 + 100) {
    cursor(HAND);
    if (mousePressed){
    stat.updatePolCap(_polcap);
    state = 4;}
  }
  
  }


void drawScreenThree(Node n) {  
  
  background(loadImage("Images/Map.png"));
  fill(128, 128, 128, 225);
  stroke(128, 128, 128, 225);
  rect(0,0, width, height);
  
  image(flag, 0, height - 100, 200, 100);
  fill(0,0,0);
  stroke(0,0,0);
  rect(0, height - 125, 200, 25);
  
  fill(255, 255, 255);
  stroke(255,255,255);
  textAlign(CENTER);
  textSize(10);
  text("The " + name + " Administration of " + country, 100, height - 110);
  
  fill(0,0,0);
  rect(width/4, height/4, width/2, height/2);
  
  fill(255, 255, 255);
  textSize(15);
  text("You have selected to modify " + n.name + " in " + country + ".", width/2, height/4 + 20);
  text("How would you like to exercise your executive power?", width/2, height/4 + 40);
  
  rect(width/2 - 65, height/2 - 20, width/7, height/10);
  
  textSize(50);
  fill(255,255,255);
  text("+", width/2 + width/7, height/2 + 20);
  fill(255,255,255);
  text("-", width/2 - width/7, height/2 + 20);
  
  fill(0,0,0);
  stroke(0,0,0);
  textSize(20);
  text(myText, width/2 + 10, height/2 + 10);
  
  if (color(255, 255, 255) == get(mouseX, mouseY) && (mouseX > width/2 + width/14 || mouseX < width/2 - width/14)){
     cursor(HAND);
   }
   else {
      cursor(ARROW);
    }
  
  
  /*
  fill(0,0,0);
  rect(width/4 + 10, height/4 + 10, width/4, height/4);
  fill(255, 0, 0);
  textSize(15);
  text("EXECUTE YOUR ORDER", width/4 + 10, height/4 + 10);
  */
  
  if (keyCode == ENTER && ((_polcap -= 1) > 0)) {
      n.set(parseInt(myText)); 
      state = 2;
      keyCode = SHIFT;//keyCode cannot be ENTER anymore. SHIFT serves as a placeholder
    }

}
     
void drawScreenFour() {
  background(loadImage("Images/Map.png"));
  fill(128, 128, 128, 225);
  stroke(128, 128, 128, 225);
  rect(0,0, width, height);
  
  image(flag, 0, height - 100, 200, 100);
  fill(0,0,0);
  stroke(0,0,0);
  rect(0, height - 125, 200, 25);

  fill(0, 0, 0);
  stroke(255,255,255);
  textSize(10);
  text("CURRENT POL CAP: " + _polcap, 50, 50);
  stat.resetPolcap();
  text("RESET STAT: " + stat.getPolcap(), 80, 80);
   
  for (Node n: _collection){
      n.tempValue = n.get();}
    
  PImage img = loadImage("Images/Gears.png");
  image(img,width/8,height/8);
  fill(128, 128, 128, 225);
  stroke(128, 128, 128, 225);
    
    
  fill(255, 255, 255);
  stroke(255, 255, 255);
  textAlign(CENTER);
  text("UPDATE", width/3 + 130, height/2 + 100, 75, 50);

  if (mouseX >= width/3 +130 && mouseX <= width/3 +215 && mouseY >= height/2 + 50 && mouseY <= height/2 + 100) {
    cursor(HAND);
    if (mousePressed){
    state = 2;} 
  }

}
  



void mouseClicked() {
  
  if (state == 0) {
    if (mouseX >= width/3 + 120 && mouseX <= width/3 + 205 && mouseY >= height/2 +50 && mouseY <= height/2 +100 && (state == 0)) {
      name = myText;
      state = 1;
    }
  }
  
  else if (state == 1) {
    if (mouseX >= width/7 && mouseY >= height/4 && mouseX <= 2*width/7 && mouseY <= height/4 + width/7) {
      country = "The Land of Oz";
      flag = loadImage("Images/Oz.png");
      state = 2;
    }
    else if (mouseX >= 3*width/7 && mouseY >=  height/4 && mouseX <= 4*width/7 && mouseY <= height/4 + width/7) {
      country = "Panem";
      flag = loadImage("Images/Panem.png");
      state = 2;
    }
    else if (mouseX >= 5*width/7 && mouseY >= height/4 && mouseX <= 6*width/7 && mouseY <= height/4 + width/7) {
      country = "Atlantis";
      flag = loadImage("Images/Atlantis.png");
      state = 2;
    }
    else if (mouseX >= 3*width/7 && mouseY >= 3*height/4 - 50 && mouseX <= 4*width/7 && mouseY <= 3*height/4 - 50 + width/7) {
      country = "Borduria";
      flag = loadImage("Images/Borduria.png");
      state = 2;
    }
  }
  
  else if (state == 2){
    for (Node n: _collection){
      if (n.getColor() == get(mouseX, mouseY)){
        curr = n;
        myText = "" + n.get();
        state = 3;
      }
    }
  }
  
  else if (state == 3) {
    if (color(255) == get(mouseX, mouseY)) {
      if (mouseX > width/2) {
        myText = "" + (Integer.parseInt(myText) + 1);
        _polcap -= 1;
      }
        
      else if (mouseX < width/2) {
        myText = "" + (Integer.parseInt(myText) - 1);
        _polcap -= 1;
      }
     
      }
      stat.updatePolCap(_polcap);
    }      
}
  
void keyPressed() {
  if (state == 0) {
    if (keyCode == ENTER) {
      name = myText;
      state = 1;
    } else if (keyCode == BACKSPACE) {
      if (myText.length() > 0) {
        myText = myText.substring(0, myText.length()-1);
      }
    } else if (myText.length() < 24 && keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      myText += key;
  
    }
  
  if (state == 2){
     if (keyCode == ENTER) {
     state = 4;
  }}
  
    if (state == 3){
     if (keyCode == ENTER) {
     state = 2;
  }}
    
  if (state == 4){
     if (keyCode == ENTER) {
     state = 2;
  }}
  
  
  }
 /* 
  if (state == 3) {
    if (keyCode == BACKSPACE) {
      if (myText.length() > 0) {
        myText = myText.substring(0, myText.length()-1);
      }
    }
    //FIGURE OUT A WAY SO THAT ONLY NUMBERS CAN BE TYPED
    else if (myText.length() < 3 && keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      myText += key;
    }
  }
  */
}