class SystemSettings{
 Point center;
 float maxXVelocity, maxYVelocity, minXVelocity, minYVelocity;
 int particleCount;
 String particleType;
 
 SystemSettings(Point center, int particleCount, float maxXVelocity, float minXVelocity, float maxYVelocity, float minYVelocity, String particleType){
   this.center = center;
   this.particleCount = particleCount;
   this.maxXVelocity = maxXVelocity;
   this.minXVelocity = minXVelocity;
   this.maxYVelocity = maxYVelocity;
   this.minYVelocity = minYVelocity;
   this.particleType = particleType;
 }
 
 Point center(){ return this.center; }
 int particleCount(){ return this.particleCount; }
 float maxXVelocity(){ return this.maxXVelocity; }
 float minXVelocity(){ return this.minXVelocity; }
 float maxYVelocity(){ return this.maxYVelocity; }
 float minYVelocity(){ return this.minYVelocity; }
}