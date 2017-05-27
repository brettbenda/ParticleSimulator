ArrayList<ForceField> forces = new ArrayList<ForceField>();
ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();
ArrayList<String> buttonNames = new ArrayList<String>();
boolean buttonHasBeenPressed = false;
UI ui;

void setup() {
  size(1000, 1250);
  background(255);
  textFont(createFont("Tahoma", 10));

  //add button names to the list, and generate the UI
  buttonNames.add("Gravity");
  buttonNames.add("Radial");
  buttonNames.add("Newton");
  buttonNames.add("System");
  buttonNames.add("Clear");
  ui = new UI(buttonNames);
}

void draw() {
  textFont(createFont("Tahoma", 10));
  background(255);

  updateSystems();
  updateForces();
  performClickOperation();
  showEverything();
}

//if a button on the UI has been pressed, we perform the desired action
void performClickOperation() {
  //get the current info from the ui
  String op = ui.getClickedButton();

  //checks when button has been released
  if (op.equals("none")) {
    buttonHasBeenPressed = false;
  }

  //if button is not pressed, check if one has been and perform action by getting data from the UI
  if (!buttonHasBeenPressed) {
    switch(op) {
    case "Newton":
      buttonHasBeenPressed = true;
      forces.add(new NewtonField(new Point(width/2, height/2), ui.newtMag.getData()));
      addNewForceToAllSystems();
      break;
    case "Radial":
      buttonHasBeenPressed = true;
      forces.add(new RadialField(new Point(width/2, height/2), ui.radMag.getData()));
      addNewForceToAllSystems();
      break;
    case "Gravity":
      buttonHasBeenPressed = true;
      forces.add(new GravityField(ui.gravMag.getData(), ui.direction.getData()));
      addNewForceToAllSystems();
      break;
    case "System":
      buttonHasBeenPressed = true;
      systems.add(new ParticleSystem(new SystemSettings(new Point(500, 500), 
        (int)ui.numberOfParticles.getData(), 
        ui.maxXVel.getData(), 
        ui.minXVel.getData(), 
        ui.maxYVel.getData(), 
        ui.minYVel.getData(), 
        ui.particleType.getData())));
      addAllForcesToNewSystem();
      break;
    case "Clear":
      buttonHasBeenPressed = true;
      systems.clear();
      forces.clear();
    }
  }
}

//adds all existing forces to a system that has just been generated
void addAllForcesToNewSystem() {
  for (int i = 0; i < forces.size(); i++) {
    systems.get(systems.size()-1).addForce(forces.get(i));
  }
}

//adds a new force to all systems that have already been generated
void addNewForceToAllSystems() {
  for (int i = 0; i < systems.size(); i++) {
    systems.get(i).addForce(forces.get(forces.size()-1));
  }
}

void updateForces() {
  for (int i = 0; i < forces.size(); i++) {
    if (forces.get(i).isRightClicked()) {
      forces.remove(i);
      for (int j = 0; j < systems.size(); j++) {
        systems.get(j).forces.clear();
        for (int k = 0; k < forces.size(); k++) {
          systems.get(j).addForce(forces.get(k));
        }
      }
    }
  }
}

//updated particle info for all systems
void updateSystems() {
  for (int i = 0; i < systems.size(); i++) {
    systems.get(i).update();
    if (systems.get(i).isRightClicked()) {
      systems.remove(i);
    }
  }
}

//displays all the graphics for the current state of the program
void showEverything() {
  textFont(createFont("Tahoma", 10));
  for (int i = 0; i < systems.size(); i++) {
    systems.get(i).show();
  }
  for (int i = 0; i < forces.size(); i++) {
    forces.get(i).show();
  }
  ui.show();
}