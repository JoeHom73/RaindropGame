

int count = 10; 
int score= 0;
int stage = 1; 
int fast = 1;
//PVector mouse;   //declare a P

Raindrop[] r = new Raindrop [count];      //declare a new Raindrop called r
Catcher c;

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  count = 10;
  size(1200, 800);
  fill(0);
  textSize(25);
  text("hold left mouse to play game", width/2, height/2);  
  text(score, width -50, height -50);
  //mouse = new PVector();     
  for (int i=0; i < count; i++) {
    //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
    r[i] = new Raindrop(1, 10);   //Initialize r. The parameters used are the initial x and y positio);
  }
  c = new Catcher(150);
}



void draw() {
  fill(255);
  text(score, width -50, height -50);
  text("level:", 50, height-50);
  text(stage, 115, height-50);


  //  background(0, 200, 255);
 for (int i=0; i < count; i++) {
    if (score == 50 && (r[i].isInContactWith(c))) {
      stage = stage +1;
      println("level up");
    }
  }
  for (int i=0; i < count; i++) {
    if (score == 100 && (r[i].isInContactWith(c))) {
      stage = stage +1;
      println("level up");
    }
  }
  for (int i=0; i < count; i++) {
    if (score == 200 && (r[i].isInContactWith(c))) {
      stage = stage +1;
      println("level up");
    }
  }
  for (int i=0; i < count; i++) {
    if (score == 300 && (r[i].isInContactWith(c))) {
      stage = stage +1;
      println("level up");
    }
  }

  if (mousePressed) {
    fill(0, 35);
    rect(0, 0, width, height);
    c.move();
    c.display();
    for (int i=0; i < count; i++) {
      //mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
      r[i].move();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      r[i].display();      //display the raindr);

      if (r[i].isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r[i].reset();        //if it is, reset th*/e raindrop
        score = score +1;
      }
      if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r[i].reset();                           //if it does, reset the raindrop
      }
    }
  }
 
}