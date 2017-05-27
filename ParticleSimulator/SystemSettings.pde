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
 
 SystemSettings(SystemSettings dummy){
   this.center = dummy.center;
   this.particleCount = dummy.particleCount;
   this.maxXVelocity = dummy.maxXVelocity;
   this.minXVelocity = dummy.minXVelocity;
   this.maxYVelocity = dummy.maxYVelocity;
   this.minYVelocity = dummy.minYVelocity;
   this.particleType = dummy.particleType;
 }
 
 Point center(){ return this.center; }
 int particleCount(){ return this.particleCount; }
 float maxXVelocity(){ return this.maxXVelocity; }
 float minXVelocity(){ return this.minXVelocity; }
 float maxYVelocity(){ return this.maxYVelocity; }
 float minYVelocity(){ return this.minYVelocity; }
 String particleType(){ return this.particleType; }
}