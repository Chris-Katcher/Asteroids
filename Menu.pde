class Menu
{
  //Make new menu objects
  MainMenu main;
  PauseMenu pause;
  DeathMenu death;
  
  /**
    *  constructor for the menu handler
    */
  Menu()
  {
    main = new MainMenu();
    pause = new PauseMenu();
    death = new DeathMenu();
  }
  
  /**
    *  Checks if we should display any of the menus, otherwise returns true
    *  Which means the main display program should display the game state
    */
  boolean Display()
  {
    if(main.display)
    {
      main.Display();
      return false;
    }
    else if (pause.display)
    {
      pause.Display();
      return false;
    }
    else if (death.display)
    {
      death.Display();
      return false;
    }
    else
    {
      return true;
    }
  }
  
  /**
    *  checks which menu needs to check for a mouse click,
    *  then tells that menu to handle it.
    */
  void HandleMouseClick()
  {
    if(main.display)
    {
      main.CheckClick();
    }
    else if(pause.display)
    {
      pause.CheckClick();
    }
    else if(death.display)
    {
      death.CheckClick();
    }
  }
  
  /**
    *  Called when the death screen should be displayed
    */
  void DeathScreen()
  {
    death.display = true;
  }
  
  /**
    *  Called when the main menu should be displayed
    */
  void MainScreen()
  {
    main.display = true;
  }
}