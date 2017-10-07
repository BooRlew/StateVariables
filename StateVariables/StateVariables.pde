//Made By Richard
//Still need to learn arrays to create the preview stroke. 

//Used state variables for both the menus and the brush states.
//I used it for the brush states to make it easy to add more brushes and toggle switch between them.

//need to add  RGB sliders instead of instructions in pant screen

//I beleive the sliders for colour were the most difficult part of the program. I think they would be the best candidates for extra for exterts



int penState;
float sizeOfPen;
float bgC;
float r, g, b, alpha;
float eraser;
int state;
boolean ifStartWasPressed;
PImage backGround;
float redTab, greenTab, blueTab;
boolean rTabClicked, gTabClicked, bTabClicked;
int redNumber, greenNumber, blueNumber;
float sMouseX;

void setup() {
  penState = 1;
  fullScreen();
  background(255);
  strokeWeight(5);
  frameRate(144);
  sizeOfPen = 50;
  r = 0;
  g = 0;
  b = 0;
  eraser = 255;
  alpha = 20;
  state = 1;
  backGround = loadImage("Background.jpg");
  
  redTab = width-500;
  greenTab = width-500;
  blueTab = width-500;
}


void draw() {
  if (state == 1) {
    mainMenu();
  } else if (state == 2) {
    drawMode();
  } else if (state == 3) {
    instructionScreen();
  }
  if (state == 2 || state == 3) {
    exitButton();
  }
}


void exitButton() {
  rectMode(CENTER);
  stroke(2);
  fill(255);
  rect(width - 50, 50, 40, 40);

  textAlign(CENTER);
  textSize(45);
  fill(0);
  text("X", width-49, 67);

  if (mouseX > width - 70 && mouseX < width - 30 && mouseY > 30 && mouseY < 70) {
    fill(100);
    rect(width - 50, 50, 40, 40);
    fill(0);
    text("X", width-49, 67);

    if (mousePressed) {
      state = 1;
    }
  }
}


//Display Instructions
void instructionScreen() {
  image(backGround, 0, 0);

  fill(20, 80, 185);
  rectMode(CENTER);
  rect(width/2, height/2, width - 300, height - 100);

  fill(0);
  textAlign(CENTER);

  text("Use UP and Down Arrows for pen size.", width/2, height/2 - 300);
  text("Use Left and Right arrows for different brushes", width/2, height/2 - 150);
  text("7,4 for Red, 8,5 for Green, 9,6 for Blue", width/2, height/2);
  text("Use 'E' to clear the screen", width/2, height/2 + 150);
  text("Right Click to erase.", width/2, height/2 + 300);
}


//Displays the main menu
void mainMenu() {
  image(backGround, 0, 0);

  cursor(ARROW);
  textAlign(CENTER);
  textSize(72);
  fill(0);
  text("Welcome to Processing Paint!", width/2, 100);

  fill(0);
  textSize(20);
  textAlign(LEFT);
  text("Made by Richard Lewis", 10, height - 10);
  menuUI();
}


//creates menu UI
void menuUI() {

  stroke(0);
  strokeWeight(3);

  fill(20, 80, 185);
  rectMode(CENTER);
  rect(width / 2, height / 4, 400, 150, 10);
  rect(width / 2, height / 2, 400, 150, 10);
  rect(width / 2, height / 1.3, 400, 150, 10);

  textAlign(CENTER);
  fill(0);
  textSize(70);
  text("Open Paint", width / 2, height / 4 + 12);

  text("Instructions", width / 2, height / 2 + 12);

  text("Exit App", width / 2, height / 1.3 + 13);

  mainMenuButtons();
}


//creates the intractivity with main buttons
void mainMenuButtons() {
  fill(240);

  if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/4 - 75 && mouseY < height/4 + 75) {
    rect(width / 2, height / 4, 400, 150, 10);

    textAlign(CENTER);
    fill(80, 130, 255);
    textSize(70);
    text("Open Paint", width / 2, height / 4 + 13);
    ifStartWasPressed = true; 

    if (mousePressed) {
      rectMode(CORNER);
      noStroke();
      fill(255);
      rect(0, 253, width, height - 250);
      state = 2;
    }
  } else if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/2 - 75 && mouseY < height/2 + 75) {
    rect(width / 2, height / 2, 400, 150, 10);

    textAlign(CENTER);
    fill(80, 130, 255);
    textSize(70);
    text("Instructions", width / 2, height / 2 + 13);

    if (mousePressed) {
      background(200);
      state = 3;
    }
  } else if (mouseX > width/2 - 200 && mouseX < width/2 + 200 && mouseY > height/1.3 - 75 && mouseY < height/1.3 + 75) {
    rect(width / 2, height / 1.3, 400, 150, 10);
    textAlign(CENTER);
    fill(80, 130, 255);
    textSize(70);
    text("Exit App", width / 2, height / 1.3 + 13);

    if (mousePressed) {
      exit();
    }
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
  if(!rTabClicked && !gTabClicked && !bTabClicked){
  paint();
  }

  createUI();

  if (ifStartWasPressed == true) {
    rectMode(CORNER);
    fill(255);
    rect(0, 253, width, height - 250);
  }
}


//Stops the pen from drawing when you click open paint
void mouseReleased() {
  ifStartWasPressed = false;
  
  rTabClicked = false;
  gTabClicked = false;
  bTabClicked = false;
}


//Create the user interface
void createUI() {
  textSize(13);

  stroke(0);
  strokeWeight(4);
  rectMode(CORNER);
  fill(20, 80, 185);
  rect( 0, 0, width, 250);

  rectMode(CENTER);
  fill(r, g, b);
  rect( width/2, 125, 300, 100);

  fill(255, 60);
  stroke(0);
  strokeWeight(2);
  rectMode(CENTER);
  rect(250, 125, 210, 210, 10);

  noStroke();

  fill(0);

  //Preview of current brush size, next and pevious brush
  if (penState == 1) {
    ellipseMode(CENTER);
    ellipse(250, 125, sizeOfPen, sizeOfPen);

    rectMode(CENTER);
    rect(100, 125, 50, 50);

    fill(0, alpha);
    ellipseMode(CENTER);
    ellipse(400, 125, 50, 50);
  } else if (penState == 2) {
    rectMode(CENTER);
    rect(250, 125, sizeOfPen, sizeOfPen);

    ellipse(400, 125, 50, 50);

    fill(0, alpha);
    ellipseMode(CENTER);
    ellipse(100, 125, 50, 50);
  } else if (penState == 3) {
    fill(0, alpha);
    ellipseMode(CENTER);
    ellipse(250, 125, sizeOfPen, sizeOfPen);

    fill(0);

    rectMode(CENTER);
    rect(400, 125, 50, 50);

    ellipse(100, 125, 50, 50);
  }

  fill(0);
  textAlign(CENTER);
  text("Red : " + (r), width/2 - 90, 200);
  text("Green : " + (g), width/2, 200);
  text("Blue : " + (b), width/2 + 90, 200);

  //textAlign(LEFT);
  //text("Use UP and Down Arrows for pen size.", width - 500, 100);
  //text("Use Num Pad to change RGB values,", width - 500, 125);
  //text("7,4 for Red, 8,5 for Green, 9,6 for Blue", width - 500, 150);
  //text("Use 'E' to clear the screen", width - 500, 175);

  //textAlign(CENTER);
  //textSize(50);
  //text("Welcome to Processing Paint!", width/2, 50);

  showSliders();
} 


//float redTab, greentab, blueTab;
//boolean rTabClicked, gTabClicked, bTabClicked;
//int redNumber, greenNumber, blueNumber;


void showSliders(){
  rectMode(CORNER);
  stroke(0);
  strokeWeight(1);
  fill(75);
  rect(width - 500, 80, 300, 3);     //top slider
  rect(width - 500, 125, 300, 3);    //middle slider  
  rect(width - 500, 170, 300, 3);    //bottom slider  
  
  sMouseX = mouseX;
  sMouseX = constrain(sMouseX, width - 500, width - 200); 
  
  sliderTabs();
  
  rectMode(CENTER);
  fill(100);
  rect(redTab, 81.5, 10, 20);
  r = int(map(redTab, width - 500, width - 200, 0, 255));
  
  rect(greenTab, 127.5, 10, 20);
  g = int(map(greenTab, width - 500, width - 200, 0, 255));
  
  rect(blueTab, 172.5, 10, 20);
  b = int(map(blueTab, width - 500, width - 200, 0, 255));
}


void sliderTabs(){
  //Red slider
  if(mouseX >= width - 500 && mouseX <= width - 200 && mouseY >= 70 && mouseY <= 90 && mousePressed && !gTabClicked && !bTabClicked){
    rTabClicked = true;
  }
  if (rTabClicked){
    redTab = sMouseX;
  }
  
  //green slider
  if(mouseX >= width - 500 && mouseX <= width - 200 && mouseY >= 120 && mouseY <= 140 && mousePressed && !rTabClicked && !bTabClicked){
    gTabClicked = true;
  }
  if (gTabClicked){
    greenTab = sMouseX;
  }
  
  //blue slider
  if(mouseX >= width - 500 && mouseX <= width - 200 && mouseY >= 170 && mouseY <= 190 && mousePressed && !rTabClicked && !gTabClicked){  
    bTabClicked = true; 
  }
  if (bTabClicked){
    blueTab = sMouseX; 
  }
}
  


//detects which brush to use
void paint() {
  if (penState == 1) {
    paintCircle();
  }
  if (penState == 2) {
    paintSquare();
  }
  if (penState == 3) {
    paintTransparent();
  }
}


void paintTransparent() {
  if ((mousePressed == true) && (mouseButton == LEFT)) {
    fill(r, g, b, alpha);
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



//paint square
void paintSquare() {
  if ((mousePressed == true) && (mouseButton == LEFT)) {
    fill(r, g, b);
    rectMode(CENTER);
    rect(mouseX, mouseY, sizeOfPen, sizeOfPen);
  }

  if ((mousePressed == true) && (mouseButton == RIGHT)) {
    fill(eraser);
    noStroke();
    rectMode(CENTER);
    rect(mouseX, mouseY, sizeOfPen, sizeOfPen);
  }
}



//Paint Circle when the mouse is pressed
void paintCircle() {
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
    if (keyCode == LEFT) {
      penState -= 1;
      if (penState <= 0) {
        penState = 3;
      }
    }
    if (keyCode == RIGHT) {
      penState += 1;
      if (penState >= 4) {
        penState = 1;
      }
    }
  }
  
  redTab = constrain(redTab, width - 495, width - 205);
  
  if (key == '7') {
    redTab += 5;
  } else if (key == '4') {
    redTab -= 5;
  } else if (key == '8') {
    greenTab += 5;
  } else if (key == '5') {
    greenTab -= 5;
  } else if (key == '9') {
    blueTab += 5;
  } else if (key == '6') {
    blueTab -= 5;
  } else if ((key == 'e') || (key == 'E')) {
    noStroke();
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