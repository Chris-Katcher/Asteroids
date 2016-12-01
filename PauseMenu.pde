class PauseMenu
{
  boolean display;
  boolean muted = false;
  
  //The following vectors are used for buttons in the pause menu
  PVector topMain;
  PVector bottomMain;
  
  PVector topQuit;
  PVector bottomQuit;
  
  PVector topMute;
  PVector bottomMute;

  /**
    *  Create a new pause menu
    */
  PauseMenu()
  {
    display = false;
    this.topQuit = new PVector(50, 900-45);
    this.topMain = new PVector( 350, 900-45);
    this.bottomMain = new PVector( 650, 903);
    this.bottomQuit = new PVector(150, 903);
    this.topMute = new PVector(800, 900-45);
    this.bottomMute = new PVector(950, 903);
    
  }
  
  /**
    *  Displays the pause menu
    */
  void Display()
  {
    tint(255,255,255);
    image(background, width/2 ,height/2);
    textSize(24);
    text("Credits", 500, 300);
    text("Song: Trance Game Limiter", 500, 450);
    text("by Tristan Demetri (Vector Project)", 500, 525);
    text("Image: Stars Space Wallpaper", 500, 600);
    text("http://krswallpaper.com/widescreens/stars-space-wallpaper-", 500,650);
    text("fullscreen.html/stars-space-wallpaper-fullscreen", 500, 700);
    textSize(48);
    text("Main Menu", 500, 900);
    text("Quit", 100, 900);
    if(!muted)
    {
      text("Mute Music", 850, 900);
    } else {
      text("Unmute", 850, 900);
    }
    
  }
  
  /**
    *  Checks to see if any of the buttons have been clicked
    */
  void CheckClick()
  {
    if (mouseX > topMain.x && mouseX < bottomMain.x
        && mouseY > topMain.y && mouseY < bottomMain.y)
        {
          menu.main.reset();
          this.display = false;
        }
    if (mouseX > topQuit.x && mouseX < bottomQuit.x
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
    *  called when the game is to be paused
    */
  void Pause()
  {
      if (display)
      {
        display = false;
      } else {
        display = true;
      }
   
  }
}