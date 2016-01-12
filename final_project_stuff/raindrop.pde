


class Raindrop { 
  PVector loc, vel, acc;
  int diam;
  color c;
  int speed;
  int fast = 1;
  int score = 0;


  //this is a constructor. you can have more than one constructor for a given class
  Raindrop(int tspeed, int size) { 
    speed = tspeed; //set speed
    diam = size; //set raindrop size
    loc = new PVector(random(diam, width-diam), 0); //set raindrop location 
    vel = new PVector(0, 2); //choose raindrop velocity 
    vel.mult(3); //multiply raindrop velocity 
    acc = new PVector(0, 2);  //give a random acceleration
    acc.mult(.5); // multiply acceleration 
    c = color(random(255), random(255), random(255)); //set color
  }

  //after declaring fields and setting up constructors, you can define your methods
  void display() { //display the raindrop
    fill(c); //choose color
    noStroke(); //no boarders 
    ellipse(loc.x, loc.y, diam, diam*5); //raindrop location
  }
  void move() {


    //acc.mult(15);

    loc.add(vel);
    if (score >= 0 && score <= 24) {
      vel.limit(2);
      if (score >= 25 && score <= 50) {
        vel.limit(5);
        println("speed up1");
      }
      if (score >= 51 && score <= 100) {
        vel.limit(7);
        println("speed up2");
      }

      if (score >= 101 && score <= 125) {
        vel.limit(9);
        println("speed up3");
      }
      if (score >= 126) {
        vel.limit(13);
        println("speed up4");
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
    loc.y= 0-diam*5;
    loc.x=random(0, width);
    vel= vel.mult(1.0000000000005);
    loc.add(vel);
    vel.limit(10);
  }

  //void fall() {
  //  loc.add(vel);
  //}
}