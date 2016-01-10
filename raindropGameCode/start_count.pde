class timer {
  int time = 5;
  


  timer() {
   
   
  }
  void display() {
    if (frameCount < 300) {
      background(0);
      text("starting soon, try to get to 500 points!", 300, 300); 
    }
 if (frameCount <= 60) {
      time = 5;
    }
    if (frameCount > 60 && frameCount <= 120) {
      time = 4;
    }
    if (frameCount > 120 && frameCount <= 180) {
      time = 3;
    }
    if (frameCount > 180 && frameCount <= 240) {
      time = 2;
    }
    if (frameCount > 240 && frameCount <= 300) {
      time = 1;
    }
    text(time, 200, 200);
  }
}