class Bullet_Manager {
  
  ArrayList<Bullet> bullets;
  
  //Slow the bullet fire rate
  Boolean shotFired;
  int bulletTimer;
  
  /**
    *  Create a manager for the bullets
    */
  Bullet_Manager ()
  {
    bullets = new ArrayList<Bullet>();
    shotFired = false;
    bulletTimer = 20;
  }
  
  /**
    *  check if the user fired a bullet
    */
  void UpdateBullets()
  {
     if( input.isKeyPressed(32) )
      {
        if(!shotFired)
        {
          bullets.add(new Bullet());
          shotFired = true;
        } //<>//
      }  //<>// //<>//
  }
  
  /**
    *  Draw any bullet thats been fired, and update the
    *  fire timer so a new bullet may be fired
    */
  void DrawBullets()
  {
    if(shotFired)
    {
      bulletTimer--;
      if( bulletTimer == 0 )
      {
        bulletTimer = 20;
        shotFired = false;
      }
    }
    for ( int i = 0 ; i < bullets.size(); i++ )
    {
      if(bullets.get(i).colliding)
      {
        bullets.remove(i);
      }
      else if(bullets.get(i).timeout <= 0)
      {
        bullets.remove(i);
      } else {
        bullets.get(i).Display();
      }
    }
  }
}