import java.util.*;

// Holds the names of the image files located in this sketch's data folder
String[] imageNames = {"badge.png","lego.png","bullet_red.png",
"samsung_galaxy.png","slime.png"};

/*
Uses Java's random class to randomly pick
an image from the imageNames array
*/
String chooseRandomImg()
{ 
  // Create new random object
  Random generator = new Random();
  // Sets the boundary for the nextInt method
  int bounds = 5;
  // Get next random interger
  int randNum = generator.nextInt(bounds);
  
  // Get absolute value
  Math.abs(randNum);
  // Choose image using randomly generated number
  String randImg = imageNames[randNum];
  
  return randImg;
}

/*
Represents the game of Memory. The game consists
in matching Tiles that have the same image, the user
clicks on a certain Tile. When this happens the image
undert the Tile is revealed. The user will then get the
chance to find another Tile with the same image. If user is
succesful, both Tiles remain face up otherwise the Tile will
turn over again and hide the image on them. 
*/
class MemoryGame
{  
  // ------- Instance variables -------
  
  // Holds all the Tiles in a game and represents the game board
  private Tile[][] gameBoard;
  // Holds all matched Tiles
  private ArrayList<Tile> matchedTiles;
  // Holds all face up Tiles in the game board
  private ArrayList<Tile> faceUpTilesList;
  // Holds recently clicked on Tiles
  private Stack tileStack;
  // Holds the number of rows in the gameBoard
  private int rows;
  // Holds the number of columns in the gameBoard
  private int columns;
  // True if the user has won, false otherwise, false by default
  private boolean gameWin;
  
  // ------- Constructors -------
  
  /*
  Creates a new game board using the specified rows and columns
  */
  public MemoryGame(int r, int c)
  {
    rows = r;
    columns = c;
    // Initialize gameBoard
    gameBoard = new Tile[r][c];
    // Initialize tilePositions
  //  tilePositions = new ArrayList<Cartesian>();
    // Initialize faceUpTilesList
    faceUpTilesList = new ArrayList<Tile>();
    // Initialize tileStack
    tileStack = new Stack();
    // Initialize macthedTiles
    matchedTiles = new ArrayList<Tile>();
    // Fill gameBoard
    fillBoard();
    // Set number of face up Tiles
    // Fill tilePositions
  //  fillPositions();
    // Set gameWin
    gameWin = false;
  }
  
  /*
  Creates a new game board depending on the user specifed difficulty
  */
  // TODO
  
  // ------- Accesor Methods -------
  
  public int getRows()
  { 
    return rows; 
  }
  
  public int getCols()
  {
    return columns;
  }
  
  // Print gameBoard with all tiles face down 
  public void showGameBoard()
  {
     // Draw Tiles face up
      for(int i = 0; i < rows; i++)
      {
        for(int j = 0; j < columns; j++)
        { 
          gameBoard[i][j].drawFaceDown(); 
        }
      }
  }
  // Returns current number of faceup tiles
  public int getCurrentTiles()
  {
    return tileStack.size();
  }
 
  // ------- Mutator methods -------

  // Fills gameBoard with Tile objects
  private void fillBoard()
  { 
    // Sets the boundary for the setRandom method
    int boundSize = rows;
    while(!isBoardFull())
    {
      // Generate a random image 
      String randImg = chooseRandomImg();
      //++counter;
      //println("Image name: " + randImg + " " + counter + "\n");
      
      // Generate 2 random positions for image on gameBoard
      Cartesian tempCoord1 = new Cartesian();
      Cartesian tempCoord2 = new Cartesian();
      
      // Generate random positions until they are not equal
      while(tempCoord1.equals(tempCoord2))
      {
        tempCoord1.setRandom(boundSize);
        tempCoord2.setRandom(boundSize);
      }
      
      // Get x and y coordinates
      int xVal1 = tempCoord1.getXCoord();
      int yVal1 = tempCoord1.getYCoord();
      int xVal2 = tempCoord2.getXCoord();
      int yVal2 = tempCoord2.getYCoord();
      
      /*
      Check if these coordinates are avalable
      */
      if(isFree(xVal1,yVal1) && isFree(xVal2,yVal2))
      {
        /*
        These coordinates are used to place the Tile in
        gameBoard appropriately 
        */
        int tileXCoord1 = (xVal1*80) + 50;
        int tileYCoord1 = (yVal1*80) + 50;
        
        int tileXCoord2 = (xVal2*80) + 50;
        int tileYCoord2 = (yVal2*80) + 50;
        
        println("Space available at: (" + tileXCoord1 + "," + tileYCoord1 + ")" +
        " and at: (" + tileXCoord2 + "," + tileYCoord2 + ")\n" + "Img: " + randImg);
        
        // Create 2 new Tile objects and place them in gameBoard
        gameBoard[xVal1][yVal1] = new Tile(randImg,tileXCoord1,tileYCoord1);
        gameBoard[xVal2][yVal2] = new Tile(randImg,tileXCoord2,tileYCoord2);
      }
    }
    println("Board is full!");
  }
  
    // ------- Other methods -------
    
    // Checks if coordiantes x and y are free in gameBoard
    private boolean isFree(int x, int y)
    {
       if(gameBoard[x][y] == null)
       {
         return true;
       }
       else
       {
         return false;
       }
    }
    
    /*
    Determines if gameBoard is completely filled
    with Tile objects
    */
    private boolean isBoardFull()
    {
      // Iterate through gameBoard
      for(int i = 0; i < rows; i++)
      {
        for(int j = 0; j < columns; j++)
        {  
          // If there is a null object in gameBoard...
          if(gameBoard[i][j] == null)
          {
            // ...the board is not full
            return false;
          }
        }
      }
      // The board is full
      return true;
    }
    
    /*
    Process mouse values
    */
    public Cartesian processMouse(int mouseXValue, int mouseYValue)
    {
      // Holds position of Tiles in gameBoard
      int iPosition = 0;
      int jPosition = 0;
      
      // Get position of Tile based on mouse values
      Cartesian tilePosition = tileLookUp(mouseXValue,mouseYValue);  
      
      // Return tilePosition
      /*
      Note! This may return an empty cartesian object, 
      the caller of this function must check if the 
      object is empty or not.
      */
      return tilePosition;
    }
    
    /*
    Prints an updated gameBoard with the Tile at 
    gameBoard[iPos][jPos] drawn face up
    */
    public void updateGameBoard(int iPos, int jPos)
    {  
      // Check if Tile has not already been drawn face up 
      if(!checkTile(gameBoard[iPos][jPos]))
       {
         // Check if Tile has not already been matched
         if(!matchedTiles.contains(gameBoard[iPos][jPos]))
         {
            // Draw specified Tile face up
            gameBoard[iPos][jPos].drawFaceUp();
        
            // Add to list of face up tiles
            faceUpTilesList.add(gameBoard[iPos][jPos]);
        
            // Add to Stack
            tileStack.push(gameBoard[iPos][jPos]);           
         }
       }
    }
    
    /*
    Checks if tempTile is currently in tileStack. If the
    tempTile is currently in tileStack then it is being
    used for matching. If not, the Tile has already been
    matched or has not been matched yet. 
    */
    public boolean checkTile(Tile tempTile)
    {  
      // Check if stack is empty
      if(tileStack.isEmpty())
      {
        return false;
      }
      else if(tileStack.peek().equals(tempTile))
      {
        return true;
      }
      else
      {
        return false;
      }
    }
        
    /*
    Performs a test to determine if two face up Tiles have
    the same image, that is, they match. Returns true if the
    Tiles match and false otherwise
    */
    public boolean isMatch()
    {  
      if(tileStack.size() < 2)
      {
        return false;
      }
       // Get last two Tiles
       Tile tempTile1 = (Tile)tileStack.pop();
       Tile tempTile2 = (Tile)tileStack.pop();
        
       // Check images of two Tiles
       String img1 = tempTile1.getImgName();
       String img2 = tempTile2.getImgName();
        
        // Compare strings
       if(img1.equals(img2))
        { 
          // Add matched tiles to their corresponding list
          matchedTiles.add(tempTile1);
          matchedTiles.add(tempTile2);
          println(matchedTiles.size());
          return true;
        }
       else
        {
          tempTile1.drawFaceDown();
          tempTile2.drawFaceDown();
          return false;
        }
    }
    
    /*
    Finds the [i][j] position of a Tile object in gameBoard
    based on the x,y coordinates of the mouse.
    Returns a Cartesian object with the [i][j] position of
    the Tile, if no object is found return an "empty" Cartesian
    object.
    */
    public Cartesian tileLookUp(int mX, int mY)
    {
      // Holds x and y coordinates of Tile
      int  xCoord = 0;
      int  yCoord = 0;
      
      // Iterate through gameBoard
      for(int i = 0; i < rows; i++)
      {
        for(int j = 0; j < columns; j++)
        {
          // Get current Tile object
          Tile tempTile = gameBoard[i][j];
          
          // Determine if mouse is hovering over tempTile
          if(hoveringOver(mX,mY,tempTile))
          {
            // If so, return [i][j] postion of tempTile
            xCoord = i;
            yCoord = j;
            Cartesian tilePosition = new Cartesian(xCoord,yCoord);
            return tilePosition;
          }
          // If not, go on to the next Tile
        }
      }
      // No Tile found, return Empty cartesian object
      Cartesian emptyCart = new Cartesian();
      return emptyCart;
    }
    
    /*
    Determines, based on mouse coordinates, if the pointer is
    hovering over the specified Tile object. Returns true if 
    the pointer is hovering over the Tile and false otherwise.
    */
    public boolean hoveringOver(int mouseXVal, int mouseYVal, Tile t)
    {
      // Get Tile coordinates
      int xCoord = t.getX();
      int yCoord = t.getY();
      
      // Get Tile boundaries
      int xBound = xCoord + 70;
      int yBound = yCoord + 70;
      
      // Determine if mouse is hovering over Tile T
      if(mouseXVal >= xCoord && mouseXVal <= xBound)
      {
        if(mouseYVal >= yCoord && mouseYVal <= yBound)
        {
          return true;
        }
      }
      
      // Return false by default
      return false;
    }
}