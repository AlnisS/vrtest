void handleKeyPressed(int pressedKeyCode) {
  switch (pressedKeyCode) {
    case 51:
      wkey = true;
      break;
    case 29:
      akey = true;
      break;
    case 47:
      skey = true;
      break;
    case 32:
      dkey = true;
      break;
    case 45:
      qkey = true;
      break;
    case 33:
      ekey = true;
      break;
  }
}

void handleKeyReleased(int releasedKeyCode) {
  switch (releasedKeyCode) {
    case 51:
      wkey = false;
      break;
    case 29:
      akey = false;
      break;
    case 47:
      skey = false;
      break;
    case 32:
      dkey = false;
      break;
    case 45:
      qkey = false;
      break;
    case 33:
      ekey = false;
      break;
  }
}

boolean wkey, akey, skey, dkey, qkey, ekey;
