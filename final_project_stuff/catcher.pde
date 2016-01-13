class Catcher {
  PVector loc;
  int diam;

  Catcher(int tDiam) {

    loc = new PVector(random (width), random(height)); //location of catacher
    diam = tDiam; //size
    loc.x= width/2;
    loc.y=height/2;
  }
  void display() { //displaying catcher
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void move(char thekeyleft, char thekeyright, char thekeyup, char thekeydown) {
    if (keyPressed && key == thekeyleft) {
      loc.x = loc.x-.1;
      println("moveleft");
    }
    if (keyPressed && key == thekeyright) {
      loc.x = loc.x+.1;
      println("moveright");
    }
    if (keyPressed && key == thekeyup) {
      loc.y = loc.y+.1;
      println("moveup");
    }
    if (keyPressed && key == thekeydown) {
      loc.y = loc.y+.1;
      println("movedown");
    }
  }
  
}
 