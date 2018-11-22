PVector outboo = new PVector(0, 0, 0);
PVector position = new PVector(0, 0, 0);
PVector velocity = new PVector(0, 0, 0);

void move() {
  // creates matrix representing view transformation and gets that data
  PMatrix3D eyeMat = new PMatrix3D();
  getEyeMatrix(eyeMat);
  
  // creates vectors representing forward and the origin of that forward vector
  PVector forwardViewVector = new PVector(0, 0, 1);
  PVector forwardViewOrigin = new PVector(0, 0, 0);
  
  // transforms those vectors according to the view
  PVector transformedForwardViewVector = eyeMat.mult(forwardViewVector, null);
  PVector transformedForwardViewOrigin = eyeMat.mult(forwardViewOrigin, null);
  
  // subtracts out view translation ( <--   . to <--.)
  transformedForwardViewVector.sub(transformedForwardViewOrigin);
  
  // forward flying booster thing
  if (mousePressed)
    velocity.add(PVector.mult(transformedForwardViewVector, -1.5));

  // create untransformed vectors representing directions of
  // movement based off of keypresses i.e. (0, 0, 1)
  PVector strafe = strafe(akey, dkey);
  PVector run = run(skey, wkey);
  PVector fly = fly(qkey, ekey);
  
  // transforms movement vectors to align with view transformation
  eyeMat.mult(strafe, strafe);
  eyeMat.mult(run, run);
  
  // subtracts out view translation
  strafe.sub(transformedForwardViewOrigin);
  run.sub(transformedForwardViewOrigin);
  
  // cancels out vertical velocity for horizontal moves
  strafe.y = 0;
  run.y = 0;
  
  // sets to consistent speed
  strafe.setMag(1);
  run.setMag(1);
  
  // applies move velocities to overall velocity
  velocity.add(strafe);
  velocity.add(run);
  velocity.add(fly);
  
  // updates position
  position.add(velocity);
  
  // applies friction
  velocity.mult(.95);
}

PVector strafe(boolean left, boolean right) {
  return new PVector((left ? 1 : 0) + (right ? -1 : 0), 0, 0);
}

PVector run(boolean backward, boolean forward) {
  return new PVector(0, 0, (backward ? 1 : 0) + (forward ? -1 : 0));
}

PVector fly(boolean down, boolean up) {
  return new PVector(0, (down ? -1 : 0) + (up ? 1 : 0), 0);
}
