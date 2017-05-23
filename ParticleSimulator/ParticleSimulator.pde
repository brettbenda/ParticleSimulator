SystemSettings settings = new SystemSettings(new Point(900,500), 500, 2, 0, 1, -1, "CIRCLE");
ParticleSystem test = new ParticleSystem(settings);

GravityField grav = new GravityField(1,"DOWN");
RadialField rad = new RadialField(new Point(100,500),1);
NewtonField newt = new NewtonField(new Point(500,500),1);

void setup(){
 size(1000,1000);
 background(255);
 textFont(createFont("Tahoma",10));
 
 test.addForce(grav);
 test.addForce(rad);
 test.addForce(newt);
}

void draw(){
  background(255);
  test.update();
  test.show();
  
  grav.show();
  rad.show();
  newt.show();
}