//creates a force field that applies a force evenly in a certain,
//static direction
class GravityField extends ForceField {
  //mag contains the magnitude of the force
  float mag;
  //dir contains the direction
  String dir;

  GravityField(float mag, String dir) {
    this.dir = dir; 
    this.mag = mag;

    //these assign velocity with the correct combination of zero and mag
    switch(dir) {
    case "DOWN":
      velocity = new Point(0, mag); 
      break;
    case "UP":
      velocity = new Point(0, -mag); 
      break;
    case "RIGHT":
      velocity = new Point(-mag, 0); 
      break;
    case "LEFT":
      velocity = new Point(mag, 0);
      break;
    }
  }

  //straight-up returns the velocity point
  Point getVelocity(Point point) { 
    return velocity;
  }

  //display details in top corner
  void show() {
    fill(0);
    textAlign(CENTER);
    //displays value in top right corner
    text("G: " + mag + " " + dir, 50, 25);
  }

  boolean isRightClicked() {
    if (mouseX > 0 && mouseX < 100) {
      if (mouseY > 0 && mouseY < 100) {
        if (mousePressed && mouseButton == RIGHT) {
          return true;
        }
      }
    }
    return false;
  }
}