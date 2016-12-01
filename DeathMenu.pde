class DeathMenu
{
  
  boolean display;
  
  //Used for the play again button
  PVector playAgainTop;
  PVector playAgainBottom;
  
  /**
    *  Create a new death menu
    */
  DeathMenu()
  {
    display = false;
    score = 0;
    this.playAgainTop = new PVector(250, 550);
    this.playAgainBottom = new PVector(750, 603);
  }
  
  /**
    *  display the death menu
    */
  void Display()
  {
    image(background, width/2 ,height/2);
    tint(255,255,255);
    text("Your Score:", 500, 400);
    text(score, 500, 500);
    text("Click here to play again!", 500, 600);
  }
  
  /**
    *  Handle mouse clicks inside of the death menu
    */
  void CheckClick()
  {
    if(mouseX > playAgainTop.x && mouseX < playAgainBottom.x
      && mouseY > playAgainTop.y && mouseY < playAgainBottom.y)
      {
        menu.main.reset();
        this.display = false;
      }
  }
}