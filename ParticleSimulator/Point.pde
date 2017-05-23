class Point{
 float x,y;
 
 Point(){ }

 Point(float x, float y){
  setX(x);
  setY(y);
 }
 
 void setX(float x){ this.x = x; }
 
 void setY(float y){ this.y = y; }
 
 float getX(){ return this.x; }
 
 float getY(){ return this.y; }

}