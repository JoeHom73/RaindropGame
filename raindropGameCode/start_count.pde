class timer {
  int time = 5;
  int timer=0;


  timer() {
    timer=frameCount;
    if (timer == timer+60) {
      time = time -1;
    }
  }
  void display() {

    text(time, 200, 200);
  }
}