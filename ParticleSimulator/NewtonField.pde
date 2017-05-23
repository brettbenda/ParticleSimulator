//this system simulates Newton's Law of Universal Gravitation

class NewtonField extends ForceField {
  Point center; //where the force is coming from
  float mag; //the magnitude of the force
  boolean isMoving = false; //if the force is clicked on to move

  NewtonField(Point center, float mag) {
    this.center = new Point(center.getX(),center.getY());
    this.mag = mag;
  }

  Point getVelocity(Point point) {
    float dx = center.getX() - point.getX(); //change in x
    float dy = center.getY() - point.getY(); //change in y
    float dist = dist(center.getX(),center.getY(),point.getX(),point.getY()); //distance between the field source and particle
    float angle = atan(dy/dx); //angle between field source and particle
    
    
    //if dx is negative, we want to negate the return values
    if (dx<0) {
      return new Point(-mag*cos(angle)/pow(dist/10,2), -mag*sin(angle)/pow(dist/10,2));
    } else { //return normal values
      return new Point(mag*cos(angle)/pow(dist/10,2), mag*sin(angle)/pow(dist/10,2));
    }
  }

  void show() {
    //if is clicked, move to mouse 
    if (isClicked()) {
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
    stroke(0);
    ellipse(center.getX(), center.getY(), 50, 50); 
    
    fill(255);
    textAlign(CENTER);
    text("N\n" + mag, center.getX(), center.getY()-5);
  }

  boolean isClicked() {
    if (isOver() && mousePressed) {
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