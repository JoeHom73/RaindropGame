class Catcher {
  PVector loc;
  int diam;

  Catcher(int tDiam) {
    loc = new PVector(mouseX, mouseY);
    diam = tDiam;
  }
  void display() {
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void move() {
   loc.x = mouseX;
   loc.y = mouseY;
  }
}