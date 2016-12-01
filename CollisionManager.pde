class CollisionManager
{
  int i = 0;
  int j = 0;
  
  /**
    *  Create a new collision manager
    */
  CollisionManager()
  {
    
  }
  
  /**
    *  Handle the collisions between the ship and big asteroids
    */
  void HandleShipCollisions()
  {
    for ( int k = 0; k < astManager.asteroids.size(); k++ ) 
    {
      if ( astManager.asteroids.get(k) == null )
      {
      } else {
        float distance = dist(astManager.asteroids.get(k).position.x, 
                              astManager.asteroids.get(k).position.y, 
                              ship.position.x, ship.position.y);
        float rads = astManager.asteroids.get(k).radius + ship. radius;
        
        if ( rads > distance )
        {
          ship.Ship_Death();
        } else {
          astManager.asteroids.get(k).colliding = false;
        }
      }
    }
  }
  
  /**
    *  Handle the collisions between bullets and big asteroids
    */
  void HandleBulletCollisions()
  {
    for ( i = 0; i < astManager.asteroids.size(); i++ ) //<>//
    {
      for ( j = 0; j < bul.bullets.size(); j++ )
        {
          if( astManager.asteroids.size() == 0 )
          {
          }
          else if ( bul.bullets.get(j) == null || astManager.asteroids.get(i) == null )
          {
          } else {
            float bulDist = dist(astManager.asteroids.get(i).position.x,
                                 astManager.asteroids.get(i).position.y, 
                                 bul.bullets.get(j).position.x, 
                                 bul.bullets.get(j).position.y);
            float bulRads = astManager.asteroids.get(i).radius + bul.bullets.get(j).radius;
            if ( bulRads > bulDist )
            {
              astManager.SplitAsteroid(astManager.asteroids.get(i).position, astManager.asteroids.get(i).velocity);
              astManager.asteroids.get(i).colliding = true;
              score = score + ( 25 * level );
              bul.bullets.remove(j);
            }
          }
      }
    }
  }
   
  /**
    *  Handle the collisions between the ship and small asteriods
    */
  void HandleSmallAsteroidCollisions()
  {
    
    for ( Asteroid_Small ast : astManager.smallAsteroids ) 
    {
      if ( ast == null )
      {
      } else {
        float distance = dist(ast.position.x, ast.position.y, ship.position.x, ship.position.y);
        float rads = ast.radius + ship. radius;
        
        if ( rads > distance )
        {
          ship.Ship_Death();
        } else {
          ast.colliding = false;
        }
      }
    }
  }
  
  /**
    *  Handle the collisions between the bullets and small asteroids
    */
  void HandleSmallBulletCollisions()
  {
    for ( j = 0; j < bul.bullets.size(); j++ )
    {
      for ( i = 0; i < astManager.smallAsteroids.size(); i++ )
        {
          if( astManager.smallAsteroids.size() == 0 || bul.bullets.size() == 0 )
          {
          }
          else if ( bul.bullets.get(j) == null || astManager.smallAsteroids.get(i) == null )
          {
          }
          else {
            float bulDist = dist(astManager.smallAsteroids.get(i).position.x,
                                 astManager.smallAsteroids.get(i).position.y, 
                                 bul.bullets.get(j).position.x, 
                                 bul.bullets.get(j).position.y);
            float bulRads = astManager.smallAsteroids.get(i).radius + bul.bullets.get(j).radius;
            if ( bulRads > bulDist )
            {
              astManager.smallAsteroids.get(i).colliding = true;
              bul.bullets.get(j).colliding = true;
              score = score + ( 50 * level );
            } else {
              
            }
          }
       }
    }
  }
}