class StringInput {
  String[] options; //the options we cycle through
  int index = 0; //start at index 0
  float x, y; //x and y coords of the center
  String name; //name of the data field
  Button right, left; //buttons to cycle through the options
  boolean hasBeenClicked = false; //by default, neither button is clicked

  StringInput(String name, String[] options, float x, float y) {
    this.name = name;
    this.options = options;
    this.x = x;
    this.y = y;
    this.left = new Button(x-25, y, 25, 25, "<");
    this.right = new Button(x+25, y, 25, 25, ">");
  }

  void show() {

    //if right is clicked, we cycle to the right of the list and loop if we go past the end
    if (right.isClicked() && !hasBeenClicked) {
      index++; 
      if (index >= options.length) {
        index = 0;
      }
      hasBeenClicked = true;
    }

    //if left is clicked, we cycle to the left of the list and loop if we go past the beginning
    if (left.isClicked() && !hasBeenClicked) {
      index--; 
      if (index < 0) {
        index = options.length-1;
      }
      hasBeenClicked = true;
    }

    //if neither is clicked, we reset hasBeenClicked
    if (!right.isClicked() && !left.isClicked()) {
      hasBeenClicked = false;
    }

    //display data
    left.show();
    right.show();
    textFont(createFont("Tahoma", width/50));
    textAlign(CENTER, CENTER);
    text(options[index], x, y);
    text(name, x, y-height/40);
  }

  String getData() {
    return this.options[index];
  }
}