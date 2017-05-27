# ParticleSimulator
A small project to create a simulator for particle physics.

## Order of Development
1. Created system that emitted particles from a given point, with a certain gravity
2. Made the system movable by mouse input (i.e. system can be clicked and dragged
3. Refactored existing code
4. Abtracted gravity out into a force (static force in static direction)
5. Added radial force (static force in variable direction [from particle to fixed point])
6. Added "newton" force (variable force based on distance from fixed point, towards the fixed point)
7. Refactored
8. Cleaned up display of existing features
9. Added button class
10. Created UI class that contains buttons for creating/clearing and allowed main to perform the actions with set default values
11. Created DataField and StringField classes to allow customization of the data
12. Updated the creation of new forces/systems to take these new data fields into account

## To Do
1. Clean up the UI, make it more intuitive.
2. Add a way to display existing forces/systems, and delete them individualy.
2. Add more customizable features (color, size/shape, etc.)
