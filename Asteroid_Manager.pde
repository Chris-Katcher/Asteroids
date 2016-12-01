class Asteroid_Manager {
  
  ArrayList<Asteroid> asteroids;
  ArrayList<Asteroid_Small> smallAsteroids;
  color diff;
  
  /**
    *  Creates the asteroid manager object
    */
  Asteroid_Manager ()
  {
    asteroids = new ArrayList<Asteroid>();
    smallAsteroids = new ArrayList<Asteroid_Small>();
    
  }
  
  /**
    *  This does the initializing of the asteroids depending on the mode
    */
  void InitializeMode(int mode)
  {
    if( mode == 5 )
    {
      diff = color (35,200,250);
    }
    else if ( mode == 10 )
    {
      diff = color (245,190,61);
    }
    else if ( mode == 15 )
    {
      diff = color (235,122,77);
    }
    else if ( mode == 20 )
    {
      diff = color (242,242,242);
    }
    for ( int i = 0; i < mode; i++ )
    {
      asteroids.add(new Asteroid(diff));
    }
  }
  
  /**
    *  Draws each asteroid
    *  and also removes asteroids that get shot
    */
  void DrawAsteroids()
  {
    for ( int i = 0 ; i < asteroids.size(); i++ )
    {
      if(asteroids.get(i).colliding)
      {
        asteroids.remove(i);
      } else {
        asteroids.get(i).Display();
        asteroids.get(i).Update();
      }
    }
  }
  
  /**
    *  Handles the split of a bigger asteroid by making
    *  two new smaller asteroids with similar movement vectors
    */ 
  void SplitAsteroid(PVector posOld, PVector velOld)
  {
    velOld.x = velOld.x*1.5;
    velOld.y = velOld.y*1.5;
    Asteroid_Small split1 = new Asteroid_Small(posOld, velOld, 45, diff);
    Asteroid_Small split2 = new Asteroid_Small(posOld, velOld, -45, diff);
    
    smallAsteroids.add(split1);
    smallAsteroids.add(split2);
    
  }
  
  /**
    *  draws the smaller asteroids
    *  and also removes smaller asteroids that get shot
    */
  void DrawSmallAsteroids()
  {
    for ( int i = 0 ; i < smallAsteroids.size(); i++ )
    {
      if(smallAsteroids.get(i).colliding)
      {
        smallAsteroids.remove(i);
      } else {
        smallAsteroids.get(i).Display();
        smallAsteroids.get(i).Update();
      }
    }
  }
}