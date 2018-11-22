import processing.vr.*;

PShape grid;
PShape cubes;

void setup() {
  fullScreen(STEREO);
  grid = createGrid();
  cubes = createCubes();
}

void draw() {
  render();
}

void calculate() {
  move();
}

void keyPressed() {
  handleKeyPressed(keyCode);
}

void keyReleased() {
  handleKeyReleased(keyCode);
}
