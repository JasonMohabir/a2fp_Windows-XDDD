import java.util.Collection;
//Stages of Game
// 0 - Opening screen
// 1 - Select country
// 2 - Game screen

int state;

final int width = 1025;
final int height = 518;
String myText = "Jim Morrison";

//===========TRACKER NODES===========
//generally measures of how the country is doing
Node _polcap = new Node(50, "Political Capital"); //the currency we use to enact action
Node _income = new Node(50, "Total Income");
Node _expenditure = new Node (50, "Total Expenditure");
Node _totalhappiness = new Node(50, "Overall Happiness");
Node _poverty = new Node(50, "Poverty");
Node _health = new Node(50, "Health");
Node _crime = new Node(50, "Crime");
Node _oildemand = new Node(50, "Oil Demand");
Node _oilprice = new Node(50, "Oil Price");
Node _oilsupply = new Node(50, "Oil Supply");
Node _unemployment = new Node(50, "Unemployment");
Node _globaleconomy = new Node(50, "Global Economy");
Node _education = new Node(50, "Education");
Node _environment = new Node(50, "The Environment");
Node _vehicleusage = new Node(50, "Vehicle Usage");
Node _gdp = new Node(50, "GDP");
Node _technology = new Node(50, "Technology");
Node[] _collection = {_polcap, _income, _expenditure, _totalhappiness, _poverty, _health, _crime, _oildemand , _oilprice, _oilsupply, _unemployment, _globaleconomy, _education, _environment, _vehicleusage, _gdp, _technology};

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
}

void draw() {
  switch(state) {
  case 0: drawScreenZero(); break;
  case 1: drawScreenOne(); break;
  case 2: drawScreenTwo(); break;
  default: background(0); break;
  }
}

void mousePressed() {
//  String s = "The quick brown fox jumped over the lazy dog.";
  fill(50);
 //text(s, 10, 10, 70, 80);  // Text wraps within text box
  //state++;
  //if (state > 2) { state = 0; }
}

void drawScreenZero() {
    background(loadImage("Map.png"));
    fill(128,128,128, 225);
    stroke(128,128, 128, 225);
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
    rect(width/3 + 120, height/2 - 20, 250,25);
    fill(0);
    stroke(0);
    text(myText, width/3 + 120, height/2);
    
    fill(0, 0, 255, 175);
    stroke(0, 0, 255, 175);
    rect(width/3 + 120, height/2 +40, 100, 50);

    fill(255,255,255);
    stroke(255,255,255);
    textAlign(CENTER);
    text("ENTER", width/3 + 130, height/2 + 50, 75, 50);
    
    if (mouseX >= width/3 +120 && mouseX <= width/3 +205 && mouseY >= height/2 + 50 && mouseY <= height/2 + 100) {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }
  
}

void drawScreenOne() {
  cursor(ARROW);
  background(loadImage("Map.png"));
  
  fill(255, 255, 0);
  stroke(0, 0, 255, 175);
  rect(0, 0, width, height/8-1);
  
  fill(0,0,0);  
  stroke(255,255,255);
  textAlign(CENTER);
  text("Selection Page", width/2, height/16);
  
  image(loadImage("Images/Oz.png"), width/7, height/4, width/7, width/7);
  image(loadImage("Images/Panem.png"), 3*width/7, height/4, width/7, width/7);  
  image(loadImage("Images/Atlantis.png"), 5*width/7, height/4, width/7, width/7);    
  image(loadImage("Images/Borduria.png"), 3*width/7, 3*height/4 - 50, width/7, width/7);

  fill(128,128,128, 225);
  stroke(128,128, 128, 225);
  rect(width/7 - 100, height/2 + 20, width/6, height/10);
 
  fill(0,0,0);
  stroke(255,255,255);
  text("The Democratic Republic of OZ", width/7 + 75, height/2 + 35);
    
}

void drawScreenTwo() {
  background(0, 0, 204);
  for (Node s : _collection){
   s.draw();     
  }
}


void mouseClicked() {
  if (mouseX >= width/3 + 120 && mouseX <= width/3 + 205 && mouseY >= height/2 +50 && mouseY <= height/2 +100 && (state == 0)) {
    //save name
    state = 2;
  }
  //redraw();
}
void keyPressed() {
  if (state == 0) {
     if (keyCode == ENTER) {
       //save name
       state = 1;
     }
    else if (keyCode == BACKSPACE) {
       if (myText.length() > 0) {
             myText = myText.substring(0, myText.length()-1);
        }
    }
    else if (myText.length() < 24 && keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
        myText += key;
     }
  }
 
}
 