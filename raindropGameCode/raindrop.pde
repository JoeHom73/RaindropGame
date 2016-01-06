


class Raindrop { 
  PVector loc, vel, acc;
  int diam;
  color c;
  int speed;


  //this is a constructor. you can have more than one constructor for a given class
  Raindrop(int tspeed, int size) { 
    speed = tspeed; //set speed
    diam = size; //set raindrop size
    loc = new PVector(random(diam, width-diam), random(diam, height-diam)); //set raindrop location 
    vel = new PVector(0, random(1, 5)); //choose raindrop velocity 
    vel.mult(3); //multiply raindrop velocity 
    acc = new PVector(0, 2);  //give a random acceleration
    acc.mult(2); // multiply acceleration 
    c = color(random(255), random(255), random(255)); //set color
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() { //display the raindrop
    fill(c); //choose color
    noStroke(); //no boarders 
    ellipse(loc.x, loc.y, diam, diam); //raindrop location
  }
  void move() {


    //acc.mult(15);
    vel.add(acc);
    vel.limit(10);
    loc.add(vel);
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
      println("Caught a raindrop in frame " + frameCount);
      return true;
    } else {
      return false;
      //}
    }
  }


  void reset() {
    loc.y= 0-diam/2;
    vel= new PVector(0, random(1, 3));
    loc.add(vel);
    vel.limit(12);
  }

  //void fall() {
  //  loc.add(vel);
  //}
}