import ddf.minim.*;

//Initialize globally the objects used to run the game
Ship ship;
InputManager input;
Asteroid_Manager astManager;
CollisionManager manageCollisions;
Bullet_Manager bul;
Menu menu;

//Store the asteroids and bullets
ArrayList<Asteroid> asteroids;
ArrayList<Bullet> bullets;

boolean shoot;

PImage background;

//Music Player
AudioPlayer player;
Minim minim;

//Game information
int mode;
int level = 5;
int score;

/**
  * Setup will create the game objects and load the background asset
  * it will also start the music player
  */
void setup() 
{
  size(1000,1000);
  background = loadImage("background.png");
  
  manageCollisions = new CollisionManager(); //<>//
  ship = new Ship();
  astManager = new Asteroid_Manager();
  input = new InputManager();
  bul = new Bullet_Manager();
  menu = new Menu();
  
  minim = new Minim(this);
  player = minim.loadFile("tracnee_16bit.wav");
  player.setGain(-15);
  player.play();
  player.loop();
}

/**
  * Draw will update the display of the game every frame.
  * it checks if the game is in one of the menus, otherwise
  * it displays the asteroids, ship and bullets.
  *
  * It will also check if the level has been cleared and resets it.
  */
void draw()
{
  if(menu.Display())
  {
    background(0);
    tint(255,255,255);
    image(background, width/2 ,height/2);
    
    astManager.DrawAsteroids();
    astManager.DrawSmallAsteroids();
    
    bul.DrawBullets();
    
    manageCollisions.HandleShipCollisions();
    manageCollisions.HandleBulletCollisions();
    manageCollisions.HandleSmallAsteroidCollisions();
    manageCollisions.HandleSmallBulletCollisions();
     
    //Check if a level is clear
    if ( astManager.asteroids.size() == 0 && 
         astManager.smallAsteroids.size() == 0 )
    {
      manageCollisions = new CollisionManager();
      astManager = new Asteroid_Manager();
      astManager.InitializeMode(mode);
      level++;
    }
    
    ship.Update();
    ship.Wrap();
    ship.Display();
    
    //Display the score
    text(score, 100, 50);
  } 
}

//Update the user input manager
void keyPressed()
{
  if ( key == ESC && !menu.main.display)
  {
    menu.pause.Pause();
    key = 0;
  }
  input.recordKeyPress(keyCode);
  
  ship.Turn();
  bul.UpdateBullets();
}

//Update the user input manager for key released
void keyReleased()
{
  input.recordKeyRelease(keyCode);
  ship.Deccelerate();
  ship.StopTurning();
  bul.UpdateBullets();
}

//Mouse clicks only matter in one of the menus
void mouseClicked()
{
  menu.HandleMouseClick();
}