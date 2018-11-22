void render() {
  background(0);
  lights();
  translate(width/2, height/2);
  translate(position.x, position.y, position.z);
  shape(cubes);
  shape(grid);
}
