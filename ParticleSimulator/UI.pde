class UI {
  ArrayList<String> buttonNames = new ArrayList<String>(); //names of the buttons
  ArrayList<Button> buttons = new ArrayList<Button>(); //the button objects to be displayed on the ui
  String[] directionOptions = {"DOWN", "UP", "LEFT", "RIGHT"}; //options for gravity direction
  String[] particleTypeOptions = {"CIRCLE", "LINE"}; //options for particle types

  //the fields we need for generating gravity fields
  DataInput gravMag = new DataInput("Gravity Strength", 1, width/10, 7.8*height/9, 10, -10, 1);
  StringInput direction = new StringInput("Gravity Direction", directionOptions, width/10, 8.2*height/9);

  //the fields for radial fields

  DataInput radMag = new DataInput("Radial Strength", 1, 3*width/10, 7.8*height/9, 10, -10, 1);

  //the fields for newton fields
  
  DataInput newtMag = new DataInput("Newton Strength",1, 5*width/10, 7.8*height/9, 10, -10, 1);

  //the fields we need for generating particle systems
  DataInput numberOfParticles = new DataInput("Particle Count", 500, 7*width/10, 7.8*height/9, 1000, 0, 50);
  StringInput particleType = new StringInput("Particle Type", particleTypeOptions, 9*width/10, 7.8*height/9);
  DataInput maxXVel = new DataInput("Max X Velocity", 1, 9*width/10, 8.2*height/9, 10, -10, 1);
  DataInput minXVel = new DataInput("Min X Velocity", -1, 7*width/10, 8.2*height/9, 10, -10, 1);
  DataInput maxYVel = new DataInput("Max Y Velocity", 1, 9*width/10, 8.6*height/9, 10, -10, 1);
  DataInput minYVel = new DataInput("Min Y Velocity", -1, 7*width/10, 8.6*height/9, 10, -10, 1);

  //default
  UI() {
  };

  //generate UI based on the buttons given
  UI(ArrayList<String> buttonNames) {
    this.buttonNames  = buttonNames;
    initializeButtons();
  }

  void show() {
    //draw background
    noStroke();
    rectMode(CENTER);
    fill(#7A9BB4);
    rect(width/2, 8*height/9, width, 2*height/9 + 10);

    //show buttons
    for (int i = 0; i<buttons.size(); i++) {
      buttons.get(i).show();
    }

    //show data fields
    gravMag.show();
    direction.show();

    radMag.show();

    newtMag.show();

    numberOfParticles.show();
    particleType.show();
    maxXVel.show();
    minXVel.show();
    maxYVel.show();
    minYVel.show();
  }

  void initializeButtons() {
    int num = buttonNames.size();
    int c = width/(100*num);

    //some magic numbers, used to give proper alignment of the buttons
    float xL = width-2*c;
    float dX = xL/(num);
    float dY = 7.25*height/9;
    float dW = dX - num*c;
    float dH = (height/18);

    c += dX/2;
    for (int i = 0; i < num; i++) {
      buttons.add(new Button(c, dY, dW, dH, buttonNames.get(i)));
      c += dX;
    }
  }

  //returns name of clicked button to main, so we can perform the appropriate action
  String getClickedButton() {
    for (int i = 0; i<buttons.size(); i++) {
      if (buttons.get(i).isClicked()) {
        return buttons.get(i).name;
      }
    }
    return "none";
  }
}