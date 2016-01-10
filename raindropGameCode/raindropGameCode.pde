int count = 20; 
int score= 0;
int stage = 1; 
int fast = 1;
int speed = 1;
int tspeed = 1;
 

Raindrop[] r = new Raindrop [count];      //declare a new Raindrop called r
Catcher c;
timer t;

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
 
  frameRate(60);
  count = 20;
  score = 0;
  size(1000, 600);
  fill(0);
  textSize(25);
  text(score, width -50, height -50);

  //mouse = new PVector();     
  for (int i=0; i < count; i++) {
    //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
    r[i] = new Raindrop(speed, 5);   //Initialize r. The parameters used are the initial x and y positio);
  }
  c = new Catcher(125);
  t = new timer();
}
void draw() {
  println(speed);
  fill(255);
  text(score, width -50, height -50);
  text("level:", 50, height-50);
  text(stage, 115, height-50);
  if (frameCount < 300) {
    t.display();
  }
  for (int i=0; i < count; i++) { 
    if (score >= 50) { //if score is greater or equal to 50
      stage = 2; //go to level 2
      speed = speed*2;
      println("level 2");
    }
    if (score >= 100) { //if score is greater or equal to 100
      stage = 3;  //go to level 3
      speed = speed*2;
      println("level 3");
    }
    if (score >= 200) { //if score is greater or equal to 200
      stage = 4; //go to level 4
      speed = speed*2;
      println("level 4");
      ;
    }
    if (score >= 300 && score <= 500) { //if score is greater or equal to 300 and less than 500
      stage = 5; //go to level 5
      speed = speed*2;
      println("level 5");
    }
    if (score > 500) { //if score is greater than 500
      stage = 6; //go to stage 6 AKA win!
      println("WIN!");
    }
  }
  if (frameCount >300) { //if framerate is less than 300 and stage is less than or equal to 5
    //run game 
    fill(0, 35); //background
    rect(0, 0, width, height);
    for (int i=0; i < count; i++) {
      if (r[i].loc.y < height + r[i].diam/2) { 
        if (stage <= 5) {

          c.move(); //call cather move
          c.display(); //display cather
          //mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
          r[i].move();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
          r[i].display();      //display the raindr);
          if (r[i].isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
            r[i].reset();        //if it is, reset th*/e raindrop
            score = score +1; //score goes up by one
          }
        }
      } else {
        //check to see if the raindrop goes below the bottom of the screen
        fill(255, 0, 0);       //if it does, you lose
        rect(0, 0, width, height);
        fill(0);
        textSize(50);
        text("You Lose!", width/2.5, height/2);
        
      }
    }
  }
  if (stage > 5) {
    fill(0, 255, 0);
    rect(0, 0, width, height);
    fill(0);
    textSize(50);
    text("you win!", width/2.5, height/2);
  }
  
  
  }
  
 