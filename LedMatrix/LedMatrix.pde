final Display d = new Display(5, 3);

void setup() {
  size(640, 360);

  // light up first two leds
  d.setLed(0, true); // light up (0-0)
  d.setLed(1, 0, true); // light up (1-0)


  // light up last row
  boolean [] row = {true, true, true, false, true};
  d.setRow(2, row);

  // light up second last col
  boolean [] col = {true, true, false};
  d.setCol(3, col);
}


void draw() {
  d.show();
}
