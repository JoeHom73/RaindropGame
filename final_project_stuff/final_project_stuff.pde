

int count = 50; 
int score= 0;
int stage = 1; 
int fast = 1;
int lenghtc=300;
int lenghtb=300;

//PVector mouse;   //declare a P

Raindrop[] r = new Raindrop [count];      //declare a new Raindrop called r
Catcher c;
Catcher b;
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  count = 50;
  size(1000, 750);
  fill(0);
  textSize(25);
  text("get ready", width/2, height/2);  
  text(score, width -50, height -50);
  //mouse = new PVector();     
  for (int i=0; i < count; i++) {
    //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
    r[i] = new Raindrop(1, 5);   //Initialize r. The parameters used are the initial x and y positio);
  }
  c = new Catcher(100);
  b = new Catcher(100);
}



void draw() {
  fill(255);
  text(score, width -50, height -50);
  text("level:", 50, height-50);
  text(stage, 115, height-50);
  rect(100, height-5, lenghtc, 5);
  rect(500, height-5, lenghtb, 5);

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

  if (frameCount >= 100) {
    fill(0, 35);
    rect(0, 0, width, height);
   for (int i=0; i < count; i++) {
    if (lenghtc >= 0) {
      c.display();
      c.move();
       if (r[i].isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r[i].reset();        //if it is, reset th*/e raindrop
        score = score +1;
        if (lenghtc > -2) {
        lenghtc=lenghtc-1;
        }
      }
    }
    if (lenghtb >= 0) {
      b.display();
      b.move();//('h', 'k','u','j');
      if (r[i].isInContactWith(b)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r[i].reset();        //if it is, reset th*/e raindrop
        score = score +1;
        if (lenghtb > -2) {
        lenghtb=lenghtb-1;
      }
      }
    }
    
      ////mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
      r[i].move();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      r[i].display();      //display the raindr);
      //if (r[i].isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      //  r[i].reset();        //if it is, reset the raindrop
     //   score = score +1;
      //  if (lenghtc > -2) {
       // lenghtc=lenghtc-2;
       // }
     // }

      //if (r[i].isInContactWith(b)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      //  r[i].reset();        //if it is, reset the raindrop
      //  score = score +1;
      //  if (lenghtb > -2) {
      //  lenghtb=lenghtb-2;
      //}
      //}
      if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
        r[i].reset();                           //if it does, reset the raindrop
      }
    }
    
  }
}

void keyPressed(){
  if(key=='h'){
    b.thekeyleft=true;
  }
  if(key=='k'){
    b.thekeyright=true;
  }if(key=='u'){
    b.thekeyup=true;
  }if(key=='j'){
    b.thekeydown=true;
  }
  if(key=='a'){
    c.thekeyleft=true;
  }
  if(key=='d'){
    c.thekeyright=true;
  }if(key=='w'){
    c.thekeyup=true;
  }if(key=='s'){
    c.thekeydown=true;
  }
}

void keyReleased() {
  
  if(key=='h'){
    b.thekeyleft=false;
  }
  if(key=='k'){
    b.thekeyright=false;
  }if(key=='u'){
    b.thekeyup=false;
  }if(key=='j'){
    b.thekeydown=false;
  }
   if(key=='a'){
    c.thekeyleft=false;
  }
  if(key=='d'){
    c.thekeyright=false;
  }if(key=='w'){
    c.thekeyup=false;
  }if(key=='s'){
    c.thekeydown=false;
  }

  
  
}