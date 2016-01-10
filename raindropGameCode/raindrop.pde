class Raindrop { 
  PVector loc, acc;
  PVector vel [] = new PVector [count];
  int diam;
  color c;
  int speed;
  int fast = 1;
  int score = 0;
  float   xvel [] = new float [count];
  //this is a constructor. you can have more than one constructor for a given class
  Raindrop(float tspeed, int size) {   

    diam = size; //set raindrop size
    for (int i=0; i < count; i++) {
      tspeed = random(5);
      loc = new PVector(random(diam, width-diam), 0); //set raindrop location 
      vel[i] = new PVector(0, tspeed); //choose raindrop velocity 
      vel[i].mult(3); //multiply raindrop velocity 
      acc = new PVector(0, 2);  //give a random acceleration
      acc.mult(.5); // multiply acceleration 
      c = color(random(255), random(255), random(255)); //set color
    }
  }
  //after declaring fields and setting up constructors, you can define your methods
  void display() { //display the raindrop
    fill(c); //choose color
    noStroke(); //no boarders 
    ellipse(loc.x, loc.y, diam, diam*5); //raindrop location
  }
  void move() {
    //acc.mult(15);

    for (int i=0; i < count; i++) {
      loc.add(vel[i]);
      vel[i].limit(.18);
      if (r[i].loc.x +  r[i].diam/2 >= width ) {
        vel[i].x= -abs(vel[i].x);
      }
      if (r[i].loc.x - r[i].diam/2 <= 0 ) {
        vel[i].x= abs(vel[i].x);
      }
    }
  }
  /*******
   void center() {
   if (loc.x-diam >= width || loc.y-diam >= height || loc.x+diam <= 0 || loc.y+diam <= 0) { 
   loc.x = width/2;
   loc.y = height/2;
   vel = PVector.random2D();
   c = color(random(255), random(255), random(255));
   }
   }
   *************/
  boolean isInContactWith (Catcher thing) { 
    if (thing.loc.dist(loc) < thing.diam/2+diam) { //if the distace between catcher and raindrop is the less than or equal to diam
      score = score +1;
      println(score);
      return true;
    } else {
      return false;
      //}
    }
  }
  void reset() {
    for (int i=0; i < count; i++) {
      loc.y= 0-diam*5;
      loc.x=random(0, width);
      loc.add(vel[i]);
    }
  }
  //void fall() {
  //  loc.add(vel);
  //}
}