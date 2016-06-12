//Stages of Game
// 0 - Opening screen
// 1 - Select country
// 2 - Game screen

int state;

final int width = 1025;
final int height = 518;
String myText = "Jim Morrison";


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
  String s = "The quick brown fox jumped over the lazy dog.";
  fill(50);
  text(s, 10, 10, 70, 80);  // Text wraps within text box
  //state++;
  //if (state > 2) { state = 0; }
}

void drawScreenZero() {
    //background(loadImage("Map.png"));
    background(51);
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
  background(51);
  
  fill(255, 255, 0);
  stroke(0, 0, 255, 175);
  rect(0, 0, width, height/8-1);
  
  fill(0,0,0);  
  stroke(255,255,255);
  textAlign(CENTER);
  text("Selection Page", width/2, height/16);
  
  fill(0,0,0);  
  //stroke(random(255),random(255),random(255));
  stroke(0,51,255);
  rect(width/7, height/4, width/7, width/7);
  
  fill(0,0,0);  
  //stroke(random(255),random(255),random(255));
  stroke(0,51,255);
  rect(3*width/7, height/4, width/7, width/7);
  
  fill(0,0,0);  
  //stroke(random(255),random(255),random(255));
  stroke(0,51,255);
  rect(5*width/7, height/4, width/7, width/7);
    
  fill(0,0,0);  
  //stroke(random(255),random(255),random(255));
  stroke(0,51,255);
  rect(3*width/7+10, 3*height/4, width/7-10, width/7-50);
    
  
}

void drawScreenTwo() {
  background(0, 0, 255);
  fill(255, 255, 0);
  triangle(150, 100, 150, 400, 450, 250);
}


void mouseClicked() {
  if (mouseX >= width/3 + 120 && mouseX <= width/3 + 205 && mouseY >= height/2 +50 && mouseY <= height/2 +100 && (state == 0)) {
    //save name
    state = 1;
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