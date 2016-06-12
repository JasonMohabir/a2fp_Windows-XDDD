//==========Stages of Game=======
float state = 0;
  //OPENING(Name input)
  //0

//==========Dimensions============
final int width = 1025;
final int height = 518;

//==========Instance Vars=======
String name = "DEFAULT";
String country ="DEFAULT";

String myText = "President ";

void setup() {
  size(1025, 518);
}

void draw() {
  
  if (state < 1) {//opening
  
    background(loadImage("Map.png"));
    
    //Outer box
    fill(128, 128,128, 225);
    stroke(128, 128, 128, 225);
    rect(width/4, height/4, width/2, height/2);
    
    //Text
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
    //Input box
    fill(255, 255, 255);
    stroke(255, 255, 255);
    rect(width/3 + 120, height/2 - 20, 250,25);
    fill(0);
    stroke(0);
    text(myText, width/3 + 120, height/2);
    
    //Enter Button
    fill(0, 0, 255, 175);
    stroke(0, 0, 255, 175);
    rect(width/3 + 120, height/2 +40, 100, 50);
    fill(255,255,255);
    stroke(255,255,255);
    textAlign(CENTER);
    text("ENTER", width/3 + 130, height/2 + 50, 75, 50);
    
    //Cursor change over Enter Button
    if (mouseX >= width/3 +120 && mouseX <= width/3 +205 && mouseY >= height/2 + 50 && mouseY <= height/2 + 100) {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }
  }
  else {
  background(0);
  }
}

//User input fxn(Clicking) --> differs per stage of game
void mouseClicked() {
  if (state ==0) {
    if (mouseX >= width/3 + 120 && mouseX <= width/3 + 205 && mouseY >= height/2 +50 && mouseY <= height/2 +100) {
      name = myText;
      myText = "";
      state = 1;
    }
  }
}

//User input fxn(Typing) --> differs per stage of game
void keyPressed() {
  
  //STAGE ONE (Name input)
  if (state == 0) {
     if (keyCode == ENTER) {//If enter is pressed, submit name and move on
       name = myText;
       myText = "";
       state = 1;
     }
    else if (keyCode == BACKSPACE) {//Delete existing text, cannot splice empty string
       if (myText.length() > 0) {
             myText = myText.substring(0, myText.length()-1);
        }
    }
    else if (myText.length() < 24 && keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
        myText += key;
     }
  }
 }