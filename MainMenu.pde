class MainMenu
{
  boolean display;
  
  boolean muted = false;
  
  //The following vectors are used for the buttons in the main menu
  
  PVector topCornerEasy;
  PVector bottomCornerEasy;
  
  PVector topCornerHard;
  PVector bottomCornerHard;
  
  PVector topCornerReallyHard;
  PVector bottomCornerReallyHard;
  
  PVector topCornerComputer;
  PVector bottomCornerComputer;
  
  PVector topQuit;
  PVector bottomQuit;
  
  PVector topMute;
  PVector bottomMute;

  /**
    *  Create a new main menu
    */
  MainMenu()
  {
    imageMode(CENTER);
    display = true;
    textSize(32);
    textAlign(CENTER);
    PFont font = loadFont("Dialog.plain-48.vlw");
    textFont(font);
    topCornerEasy = new PVector(350, 400-45);
    bottomCornerEasy = new PVector(650, 403);
    topCornerHard = new PVector(350,500-45);
    bottomCornerHard = new PVector(650, 503);
    topCornerReallyHard = new PVector(300,600-45);
    bottomCornerReallyHard = new PVector(700, 603);
    topCornerComputer = new PVector(300, 700-45);
    bottomCornerComputer = new PVector(700, 703);
    topQuit = new PVector(50, 900-45);
    bottomQuit = new PVector(150, 903);
    topMute = new PVector(800, 900-45);
    bottomMute = new PVector(950, 903);
  }
  
  /** 
    *  Display the main menu
    */
  void Display()
  {
    image(background, width/2 ,height/2);
    tint(255,255,255);
    textSize(72);
    text("Asteroids for Computers", 500, 150);
    textSize(32);
    text("Seriously, it's hard", 500, 200);
    textSize(48);
    text("Easy Mode", 500, 400);
    text("Hard Mode", 500, 500);
    text("Really Hard Mode", 500, 600);
    text("Computer Mode", 500, 700);
    text("Quit", 100, 900);
    if(!muted)
    {
      text("Mute Music", 850, 900);
    } else {
      text("Unmute", 850, 900);
    }
  }
  
  /**
    *  Handles mouse clicks inside the main menu
    */
  void CheckClick()
  {
    if(mouseX > topCornerHard.x && mouseX < bottomCornerHard.x
      && mouseY > topCornerHard.y && mouseY < bottomCornerHard.y)
      {
        mode = 10;
        this.display = false;
        astManager.InitializeMode(mode);
      }
    else if ( mouseX > topCornerReallyHard.x && mouseX < bottomCornerReallyHard.x
          && mouseY > topCornerReallyHard.y && mouseY < bottomCornerReallyHard.y)
          {
            mode = 15;
            this.display = false;
            astManager.InitializeMode(mode);
          }
    else if ( mouseX > topCornerComputer.x && mouseX < bottomCornerComputer.x
          && mouseY > topCornerComputer.y && mouseY < bottomCornerComputer.y)
          {
            mode = 20;
            this.display = false;
            astManager.InitializeMode(mode);
          }
    else if (mouseX > topCornerEasy.x && mouseX < bottomCornerEasy.x
          && mouseY > topCornerEasy.y && mouseY < bottomCornerEasy.y)
          {
            mode = 5;
            this.display = false;
            astManager.InitializeMode(mode);
          }
    else if (mouseX > topQuit.x && mouseX < bottomQuit.x
          && mouseY > topQuit.y && mouseY < bottomQuit.y)
          {
            exit();
          }
    else if (mouseX > topMute.x && mouseX < bottomMute.x
          && mouseY > topMute.y && mouseY < bottomMute.y)
          {
            if(!muted)
            {
              player.setGain(-100);
              muted = true;
            } else {
              player.setGain(-15);
              muted = false;
            }
          }
  } 
  
  /**
    *  Called to reset the game after clicking the play again message
    */
  void reset()
  {
    this.display = true;
    ship = new Ship();
    score = 0;
    astManager = new Asteroid_Manager();
  }
}