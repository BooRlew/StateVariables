float sizeOfPen;
float bgC;
float r, g, b;
float eraser;
int state;
boolean ifStartWasPressed;


void setup() {
  fullScreen();
  background(255);
  strokeWeight(5);
  frameRate(144);
  sizeOfPen = 50;
  r = 0;
  g = 0;
  b = 0;
  eraser = 255;
  state = 1;
}


void draw() {
  if (state == 1) {
    mainMenu();
  } 
  else if (state == 2) {
    drawMode();
  } 
  else if (state == 3) {
  }
}


//Displays the main menu
void mainMenu(){
  cursor(ARROW);
  menuUI();
  
  
}


//creates menu UI
void menuUI(){
  background(200);
  
  stroke(0);
  strokeWeight(3);
  
  fill(150);
  rectMode(CENTER);
  rect(width / 2, height / 4, 400, 150);
  rect(width / 2, height / 2, 400, 150);
  rect(width / 2, height / 1.4, 400, 150);
  
  textAlign(CENTER);
  fill(40);
  textSize(70);
  text("Open Paint",width / 2, height / 4 + 13);
  
  mainMenuButtons();
}


//creates the intractivity with main buttons
void mainMenuButtons(){
  fill(240);
  if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/4 - 75 && mouseY < height/4 + 75){
    rect(width / 2, height / 4, 400, 150);
    textAlign(CENTER);
    fill(40);
    textSize(70);
    text("Open Paint",width / 2, height / 4 + 13);
    ifStartWasPressed = true; 
    if (mousePressed){
      rectMode(CORNER);
      noStroke();
      fill(255);
      rect(0, 253, width, height - 250);
      state = 2;
    }
  }
  else if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 - 75 && mouseY < height/2 + 75){
    rect(width / 2, height / 2, 400, 150);    
  }
  else if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/1.4 - 75 && mouseY < height/1.4 + 75){
    rect(width / 2, height / 1.4, 400, 150);    
  }
}



//turns on the standard draw mode
void drawMode() {
  cursor();

  noStroke();

  sizeOfPen = constrain(sizeOfPen, 2, 200);

  //Color
  fill(r, g, b);
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);

  paint();

  createUI();
  if (ifStartWasPressed == true){
    rectMode(CORNER);
    fill(255);
    rect(0, 253, width, height - 250); 
    //ifStartWasPressed = false;
  }
  
}



void mouseReleased(){
  ifStartWasPressed = false; 
}


//Create the user interface
void createUI() {
  textSize(13);

  stroke(100);
  strokeWeight(4);
  rectMode(CORNER);
  fill(175);
  rect( 0, 0, width, 250);

  stroke(75);

  rectMode(CENTER);
  fill(r, g, b);
  rect( width/2, 125, 300, 100);

  noStroke();

  fill(0);
  ellipseMode(CENTER);
  ellipse(250, 125, sizeOfPen, sizeOfPen);

  fill(75);
  textAlign(CENTER);
  text("Red : " + (r), width/2 - 75, 200);
  text("Green : " + (g), width/2, 200);
  text("Blue : " + (b), width/2 + 75, 200);

  textAlign(LEFT);
  text("Use UP and Down Arrows for pen size.", width - 500, 100);
  text("Use Num Pad to change RGB values,", width - 500, 125);
  text("7,4 for Red, 8,5 for Green, 9,6 for Blue", width - 500, 150);
  text("Use 'E' to clear the screen", width - 500, 175);

  textAlign(CENTER);
  textSize(50);
  text("Welcome to Processing Paint!", width/2, 50);
}




//Paint when the mouse is pressed
void paint() {
  if ((mousePressed == true) && (mouseButton == LEFT)) {
    fill(r, g, b);
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, sizeOfPen, sizeOfPen);
  }

  if ((mousePressed == true) && (mouseButton == RIGHT)) {
    fill(eraser);
    noStroke();
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, sizeOfPen, sizeOfPen);
  }
}



//Change the size and colour of the pen and also clear the background
void keyPressed() {
  if ((keyPressed == true) && (key == CODED)) {
    if (keyCode == UP) {
      sizeOfPen += 2;
    } else if (keyCode == DOWN) {
      sizeOfPen -= 2;
    }
  }

  if (key == '7') {
    r += 5;
  }  
  if (key == '4') {
    r -= 5;
  }
  if (key == '8') {
    g += 5;
  }
  if (key == '5') {
    g -= 5;
  }
  if (key == '9') {
    b += 5;
  }
  if (key == '6') {
    b -= 5;
  }
  if ((key == 'e') || (key == 'E')) {
    //background(255);
    rectMode(CORNER);
    fill(255);
    rect(0, 253, width, height - 250);
  }
}



//Show and hide the cursor when needed
void cursor() {
  if (mouseY > 250) {
    cursor(CROSS);
  } else {
    cursor(ARROW);
  }
}