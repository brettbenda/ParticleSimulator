class ParticleSystem{
 SystemSettings settings; //base settings for particle generation
 int numberOfParticles; //number that will exist at a given time
 Point center; //location of emitter
 ArrayList<ForceField> forces = new ArrayList<ForceField>(); //all the forces applied to the system
 Particle[] system; //the array of particles
 boolean isMoving; //if the system is clicked on to move
 
 ParticleSystem(SystemSettings settings){
   this.settings = settings;
   this.center = settings.center();
   this.numberOfParticles = settings.particleCount();
   this.system = new Particle[numberOfParticles];
   
   initialize();
 }
 
 //return a new particle
 Particle generateNewParticle(){
   return new Particle(new Point(center.getX(),center.getY()),new Point(random(settings.minXVelocity(),settings.maxXVelocity()),random(settings.minYVelocity(),settings.maxYVelocity())),settings.particleType);
 }
 
 //initializes all particles at beginning of program
 void initialize(){
   for(int i = 0; i<numberOfParticles; i++){
    system[i] = generateNewParticle();
   }
 }
 
 //draws the emitter, with details
 void show(){
   fill(255);
   stroke(0);
   ellipse(center.getX(),center.getY(),50,50);
   
   fill(0);
   textAlign(CENTER);
   text("P\n" + numberOfParticles,center.getX(),center.getY());
   for(int i = 0; i<numberOfParticles; i++){
    system[i].show();
   }
 }
 
 //updates info for all particles, and location of emitter if it is clicked
 void update(){
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
   
   for(int i = 0; i<numberOfParticles; i++){
    if(system[i].isOutOfBounds()){
       system[i] = generateNewParticle();
    }else{
       system[i].update(forces);
    }
   }
 }
 
 boolean isLeftClicked(){
  if(isOver() && mousePressed && mouseButton == LEFT){
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
 
 boolean isOver(){
  if(dist((float)mouseX,(float)mouseY,center.getX(),center.getY()) < 25){
    return true;
  }
  return false;
 }
 
 //add force to list of forces acting on the system
 void addForce(ForceField newField){
   forces.add(newField);
 }
}