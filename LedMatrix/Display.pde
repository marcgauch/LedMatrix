class Display {

  private final int cols;
  private final int rows;
  private final boolean[] leds;
  private float ledDiameter = 20;

  // Constructor
  // cols: How many Columns the display should have
  // rows: How many Rows the display should have
  public Display(int cols, int rows) {
    if (cols <= 0) {
      throw new RuntimeException("Cols must be at least 1");
    }
    if (rows <= 0) {
      throw new RuntimeException("Rows must be at least 1");
    }
    this.cols = cols;
    this.rows = rows;
    this.leds = new boolean[cols*rows];
  }

  // Overwrite the default ledDiameter
  public void setLedDiameter(float newDiameter) {
    if (newDiameter <= 0) {
      throw new RuntimeException("Diameter must be greather than 0");
    }
    this.ledDiameter = newDiameter;
  }

  // Set state of one Led. (leds are numberes from 0 (top left) to col-1 (top right) and then next row starting with col
  public void setLed(int number, boolean state) {
    if (number <0 || number >= this.rows * this.cols) {
      throw new RuntimeException("Number must be between 0 and cols*rows");
    }
    this.leds[number] = state;
  }
  // Set state of one Led adressed by col and row (0-0) is top left
  public void setLed(int col, int row, boolean state) {
    if (col < 0 || col >= this.cols) {
      throw new RuntimeException("Col must be between 0 and cols");
    }
    if (row < 0 || row >= this.rows) {
      throw new RuntimeException("Row must be between 0 and rows");
    }
    this.setLed(row*this.cols+col, state);
  }

  // set the whole row 
  // boolean [] row = {true, true, false, false,true};
  // d.setRow(1, row);
  public void setRow(int row, boolean[] states) {
    if (row < 0 || row >= this.rows) {
      throw new RuntimeException("Row must be between 0 and rows");
    }
    if (states.length != this.cols) {
      throw new RuntimeException("states does not have the same length as a col");
    }
    int start = row*this.cols;
    for (int i = 0; i < this.cols; i++) {
      this.setLed(start+i, states[i]);
    }
  }

  // set whole column
  // boolean [] col = {true, true, false};
  // d.setCol(4, col);
  public void setCol(int col, boolean[] states) {
    if (col < 0 || col >= this.cols) {
      throw new RuntimeException("Col must be between 0 and cols");
    }
    if (states.length != this.rows) {
      throw new RuntimeException("states does not have the same length as a row");
    }
    int start = col;
    for (int i = 0; i < this.rows; i++) {
      this.setLed(start+i*this.cols, states[i]);
    }
  }

  // method to display the matrix
  public void show() {
    ellipseMode(CORNER);
    int counter = 0;
    for (int r = 0; r < this.rows; r++) {
      for (int c = 0; c < this.cols; c++) {
        if (this.leds[counter]) {
          fill(color(255, 0, 0));
        } else {
          fill(color(40, 40, 40));
        }
        ellipse(c*ledDiameter, r*ledDiameter, ledDiameter, ledDiameter);
        ++counter;
      }
    }
  }
}
