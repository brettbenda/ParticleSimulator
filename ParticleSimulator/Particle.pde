class Particle {
  Point current; //current x and y location
  Point old; //previous x and y location
  Point velocity; //current velocity
  String type;

  Particle() {
  }

  Particle(Point current, Point velocity, String type) {
    this.current = current;
    this.old = new Point(current.getX(), current.getY()); //do not want same reference
    this.velocity = velocity;
    this.type = type;
  }

  void show() {
    switch(type) {
    case "LINE":
      strokeWeight(1);
      //draw line between old and current point
      line(current.getX(), current.getY(), old.getX(), old.getY()); 
      break;
    case "CIRCLE":
      noStroke();
      fill(0);
      ellipse(current.getX(), current.getY(), 5, 5);
      break;
    }
  }

  void update(ArrayList<ForceField> forces) {

    float dx = 0; //change in x velocity
    float dy = 0; //change in y velocity

    for (int i = 0; i<forces.size(); i++) {
      dx += forces.get(i).getVelocity(this.current).getX(); //sum x forces of all ForceFields
      dy += forces.get(i).getVelocity(this.current).getY(); //sum y forces of all ForceFields
    }

    //update old location point 
    old.setX(current.getX());
    old.setY(current.getY());

    //update current location point
    current.setX(current.getX() + velocity.getX());
    current.setY(current.getY() + velocity.getY());

    //update velocity to be updated next iteration
    velocity.setX(velocity.getX() + dx);
    velocity.setY(velocity.getY() + dy);
  }

  boolean isOutOfBounds() {
    if ((current.getX() < 0 || current.getX() > width) && (old.getX() < 0 || old.getX() > width)) {
      return true;
    }
    
    //for y, we must subtract the height of the UI on the bottom
    if ((current.getY() < 0 || current.getY() > height-2*height/9) && (old.getY() < 0 || old.getY() > height-2*height/9)) {
      return true;
    }
    return false;
  }
}