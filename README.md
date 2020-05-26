# LedMatrix

Very simple Project to show a LedMatrix.

## Requirements

Download [Processing](https://processing.org/) and you can start

## Code

### LedMatrix.pde

```Display d = new Display(int nColumns, int nRows);``` to create a Display with *nColumns* x *nRows* Leds

```d.show();``` to show it

### Disyplay.pde

#### Constructor

```public Display (int nColumns, int nRows)``` Constructor for a Display with *nColumns* x *nRows* Leds

#### LedDiameter

Default *ledDiameter* is 20.0 (change it with ```setLedDiameter(float newDiameter);```

#### switch Light

```setLed(int number, boolean state);``` or ```setLed(int col, int row, boolean state) ```

to set State of a led.

Use *number* if you want to iterate (starts at 0 top-left, and then +1 to the right)
Use *col and row* to select a led (starting at 0)

#### switch whole row or column

```setRow(int row, boolean[] states);```

```setCol(int col, boolean[] states);```

*states* has to be an array with the same length as leds in this row or column
( ```boolean [] col = {true, true, false};```)

#### show matrix

```show();```
to show de matrix
