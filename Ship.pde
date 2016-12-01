class Ship
{
  //Movement Vectors
  PVector position;
  PVector direction;
  PVector velocity;
  PVector acceleration;
  
  //Movement properties
  float speed;
  float maxSpeed;
  boolean accelerate = false;
  boolean turnLeft = false;
  boolean turnRight = false;
  
  //Collision properties
  float radius;
  boolean cannotCollide = false;
  int invTimer = 4*60;
  int lives = 2;
  boolean fliker;
  
  //Display images
  PShape shipModel;
  PImage sheild;

  /**
    *  Create a new ship that the player controls
    */
  Ship()
  {
    this.position = new PVector(width/2, height/2);
    this.velocity = new PVector(0, 0);
    this.direction = new PVector(1,0);
    this.acceleration = new PVector(0,0);
    this.radius = 15;
    
    this.shipModel = createShape();
    shipModel.beginShape();
    shipModel.fill(255,255,255);
    shipModel.vertex(20,0);
    shipModel.vertex(-20,-10);
    shipModel.vertex(-20,10);
    shipModel.endShape();
    
    this.sheild = loadImage("sheild.png");
    sheild.resize(75,75);
    this.fliker = true;
  }
  
  /**
    *  Turn checks to see if the ship should rotate
    *  then rotates it in the correct direction
    */
  void Turn()
  {
  // When arrow keys are pressed, rotate direction
    if(input.keys[LEFT])
    {
      turnLeft = true;
    }
    else if(input.keys[RIGHT])
    {
      turnRight = true;
    }
    else if(input.keys[UP])
    {
      accelerate = true;
    }
  }
  
  /**
    *  Check if the ship is deccelerating
    */
  void Deccelerate()
  {
    if(!input.keys[UP])
    {
      accelerate = false;
    }
  }
  
  /**
    *  Called to notify the movement manager
    *  that the ship should stop turning
    */
  void StopTurning()
  {
    if(!input.keys[LEFT])
    {
      turnLeft = false;
    }
    if(!input.keys[RIGHT])
    {
      turnRight = false;
    }
  }
  
  /**
    *  Handle the ship moving off the screen
    */
  void Wrap()
  {
    if(position.x > width){
      position.x = 0;
    }
    else if(position.x < 0){
      position.x = width;
    }
    else if(position.y > height){
      position.y = 0;
    }
    else if(position.y < 0){
      position.y = height;
    }
  }
  
  /**
    *  This is the ships movement manager, it will first check if the
    *  ship should accelerate or not, then checks if it should turn
    *  then handles the invulnerablility timer, and finally updates
    *  the position.
    */
  void Update()
  {
    // Move the ship's position using acceleration, velocity, position here!
    this.Wrap();
    if(!accelerate)
    {
      acceleration.mult(.94);
    } else {
      acceleration.add(.25,.25);
    }
    
    if(turnLeft)
    {
      direction.rotate(radians(-6));
    }
    if(turnRight)
    {
      direction.rotate(radians(6 ));
    }
    if(cannotCollide)
    {
      if(invTimer > 0)
      {
        invTimer--;
      } else {
        cannotCollide = false;
        invTimer = 240;
      }
    }
    velocity.x = direction.x*acceleration.x;
    velocity.y = direction.y*acceleration.y;
    this.velocity.limit(7);
      position.x += velocity.x;
      position.y += velocity.y;
  }
  
  /**
    *  Displays the ship and the shield
    */
  void Display()
  {
    if(invTimer % 10 == 0)
    {
      if(fliker)
      {
        fliker = false;
      } else {
        fliker = true;
      }
    }
    pushMatrix();
      translate(position.x, position.y);
      rotate(direction.heading());
      if(cannotCollide)
      {
        if(fliker)
        {
          tint(255,255,255);
          image(sheild, 0, 0);
        }
      }
      shape(shipModel, 0,0);
      stroke(0);
    popMatrix();
    for( int i = 0; i < lives; i++)
    {
      pushMatrix();
        translate(50+i*30, 100);
        rotate(radians(-90));
        shape(shipModel,0,0);
      popMatrix();
    }
  }
  
  /**
    *  Handles what should happen when the ship collides with
    *  and asteroid.
    */
  void Ship_Death()
  {
    if( lives > 0 && !cannotCollide)
    {
    this.position = new PVector(width/2, height/2);
    this.velocity = new PVector(0, 0);
    this.direction = new PVector(1,0);
    this.acceleration = new PVector(0,0);
    lives--;
    cannotCollide = true;
    } else if (lives == 0 && !cannotCollide) {
      //goto end screen
      menu.DeathScreen();
    }
  }
}