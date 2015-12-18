int count =100; 
//PVector mouse;   //declare a P
Raindrop[] r = new Raindrop [count];      //declare a new Raindrop called r
Catcher c;

// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  //mouse = new PVector();     
  for (int i=0; i < count; i++) {
    //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
    r[i] = new Raindrop(1, 30);   //Initialize r. The parameters used are the initial x and y positio);
  }
  c = new Catcher(50); 
}
void draw() {
  background(0, 200, 255);
    
  for (int i=0; i < count; i++) {
    c.display();
    c.move();
    //mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
    r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
    r[i].display();      //display the raindr);
  
    if (r[i].isInContactWith(c)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
      r[i].reset();                         //if it is, reset th*/e raindrop
    }
    if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      r[i].reset();                           //if it does, reset the raindrop
    }
  }
}