PShape createGrid() {
  PShape grid = createShape();
  grid.beginShape(LINES);
  grid.stroke(255);
  for (int x = -10000; x < +10000; x += 250) {
    grid.vertex(x, +1000, +10000);
    grid.vertex(x, +1000, -10000);
  }
  for (int z = -10000; z < +10000; z += 250) {
    grid.vertex(+10000, +1000, z);
    grid.vertex(-10000, +1000, z);      
  }  
  grid.endShape();
  return grid;
}

PShape createCubes() {
  PShape cubes = createShape(GROUP);
  for (int i = 0; i < 100; i++) {
    float x = random(-1000, +1000); 
    float y = random(-1000, +1000);
    float z = random(-1000, +1000);    
    float r = random(50, 150);
    PShape cube = createShape(BOX, r, r, r);
    cube.setStroke(false);
    cube.setFill(color(180));
    cube.translate(x, y, z);
    cubes.addChild(cube);
  }
  return cubes;
}

PShape createBarriers() {
  PShape barriers = createShape(GROUP);
  for (int i = -10000; i < 10000; i+= 2000) {
    float x = 0; 
    float y = random(-500, +500);
    float z = i;    
    PShape barrier = createShape(BOX, 2000, 250, 50);
    barrier.setStroke(false);
    barrier.setFill(color(180));
    barrier.translate(x, y, z);
    barriers.addChild(barrier);
  }
  return barriers;
}
