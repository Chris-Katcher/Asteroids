class Asteroid {
  
  //Vectors for movement
  PVector position;
  PVector direction;
  PVector velocity;
  
  //Collision properties
  float radius;
  boolean colliding;
  boolean destroyed;
  
  //Asteroid display properties
  String imgName;
  PImage img;
  int randomAst;
  color difficulty;
  
  /**
    *  Create a new Asteroid object, 
    *  requires the color of the asteroid to be made
    */
  Asteroid (color dif) //<>//
  {
    // Instantiate vectors and fields
    this.position = new PVector ( (int)random(0, width), (int)random(0, height) ); //<>//
    
    //Check that the asteroid isn't spawning ontop of the player
    while(position.x < (ship.position.x+200) && position.x > (ship.position.x-200) //<>//
        && position.y < (ship.position.y+200) && position.y > (ship.position.y-200))
        {
          this.position = new PVector ( (int)random(0, width), (int)random(0, height) );
        }
    this.direction = new PVector ( random(-1, 1), random(-1, 1) );
    this.velocity = direction.copy();
    this.velocity.mult(4);
    radius = 125/2;
    
    randomAst = (int)random(1,10);
    imgName = "ast" + randomAst + ".png";
    img = loadImage(imgName);
    imageMode(CENTER);
    
    colliding = false;
    destroyed = false;

    this.difficulty = dif;
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