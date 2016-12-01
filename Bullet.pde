class Bullet {
  
  //Movement properties
  PVector velocity;
  PVector position;
  
  //Display properties
  PShape bullet;
  
  //Collision Properties
  int radius = 5;
  boolean colliding = false;
  
  //Bullet Properties
  boolean shoot;
  int timeout;
  
  /**
    *  Create a new bullet, with a timeout property
    */
  Bullet ()
  {
    this.position = ship.position.copy();
    this.velocity = ship.direction.copy();
    velocity.mult(random(10,13));
    this.shoot = true;
    this.timeout = 240;
    
  }
  
  /**
    *  Shoot this bullet
    */
  void Shoot()
  {
    this.shoot = true;
  }
  
  /**
    *  Update the bullet's position
    */
  void Update()
  {
    position.x += velocity.x;
    position.y += velocity.y;
  }
  
  /**
    *  Display this bullet if it has been shot
    */
  void Display() 
  {
    if(shoot)
    {
      Update();
      ellipse(position.x, position.y, radius, radius);
      timeout--;
    }
  }
}