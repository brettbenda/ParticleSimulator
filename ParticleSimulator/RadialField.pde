//Create a radial force field that attracts equally from all points
//towards a single point

class RadialField extends ForceField {
  Point center; //where the force is coming from
  float mag; //the magnitude of the froce
  boolean isMoving = false; //if the force is clicked on to move

  RadialField(Point center, float mag) {
    this.center = new Point(center.getX(),center.getY());
    this.mag = mag;
  }

  Point getVelocity(Point point) {
    float dx = this.center.getX() - point.getX(); //change in x
    float dy = this.center.getY() - point.getY(); //change in y
    float angle = atan(dy/dx); //angle between field source and particle
    
    
    //if dx is negative, we want to negate the return values
    if (dx<0) {
      return new Point(-mag*cos(angle), -mag*sin(angle));
    } else { //return normal values
      return new Point(mag*cos(angle), mag*sin(angle));
    }
  }

  void show() {
    //if is clicked, move to mouse 
    if (isLeftClicked()) {
      isMoving = true;
    }
    if(!mousePressed){
     isMoving = false; 
    }
    if(isMoving){
     center.setX(mouseX);
     center.setY(mouseY); 
    }

    //draw identifiers
    fill(0,200);
    ellipse(center.getX(), center.getY(), 50, 50); 
    fill(255);
    
    textAlign(CENTER);
    text("R\n" + mag, center.getX(), center.getY());
  }

  boolean isLeftClicked() {
    if (isOver() && mousePressed && mouseButton == LEFT) {
      return true;
    }
    return false;
  }
  
  boolean isRightClicked() {
    if (isOver() && mousePressed && mouseButton == RIGHT) {
      return true;
    }
    return false;
  }

  boolean isOver() {
    if (dist(center.getX(), center.getY(),mouseX,mouseY) < 25) {
      return true;
    }
    return false;
  }
}