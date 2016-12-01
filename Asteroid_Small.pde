class Asteroid_Small {
  
  //Vectors for movement
  PVector position;
  PVector direction;
  PVector velocity;
  
  //Collision properties
  float radius;
  boolean colliding;
  boolean destroyed;
  
  //Asteroid display properties
  int randomAst;
  String imgName;
  PImage img;
  color difficulty;
  
  /**
    *  Create a new Small Asteroid object, 
    *  requires the color of the asteroid to be made
    */
  Asteroid_Small(PVector pos, PVector vel, int ang, color diff)
  {
    // Instantiate vectors and fields
    this.position = pos.copy();
    this.direction = vel.copy();
    this.direction.rotate(radians(ang));
    this.velocity = direction.copy();
    radius = 125/3;
    
    randomAst = (int)random(1,10);
    imgName = "ast" + randomAst + ".png";
    img = loadImage(imgName);
    img.resize(250/3, 250/3);
    imageMode(CENTER);
    
    colliding = false;
    destroyed = false;
    this.difficulty = diff;
  }
  
  /**
    *  Update will make sure the asteroid isn't destroyed,
    *  and then update its position
    */
  void Update()
  {
    if(!destroyed)
    {
      this.Wrap();
      position.x += velocity.x;
      position.y += velocity.y;
    }
  }
  
  /**
    *  Handle the asteroid going past the boundry of the game
    */
  void Wrap()
  {
    if(position.x > width+125/2){
      position.x = -125/2;
    }
    else if(position.x < -125/2){
      position.x = width+125/2;
    }
    else if(position.y > height+125/2){
      position.y = -125/2;
    }
    else if(position.y < -125/2){
      position.y = height+125/2;
    }
  }
  
  /**
    *  Display this asteroid
    */
  void Display()
  {
    tint(difficulty);
    image(img, position.x, position.y);
  }
}