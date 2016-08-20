/*
Represents a tile in the memory card game
Each Tile has a fixed size and a corresponding
image
*/

class Tile
{
  // ------- Instance variables -------
  
  // Constant length and width 
  private final int tLength = 70;
  private final int tWidth = 70;
  // X coordinate of the tile
  private int x;
  // Y coordinate of the tile
  private int y; 
  // X coordinate of the image
  private int imgX;
  // Y coordinate of the image
  private int imgY;
  // Image of the tile
  private PImage tileImg;
  // Background image for each Tile
  private PImage bgImg;
  // Holds image name
  private String imgName;
  
  // ------- Constructor -------
  
  // To build a Tile object specify the name of the image located in the data directory
  public Tile(String image, int xCoord, int yCoord)
  {  
    // Load Tile Image
    tileImg = loadImage(image);
    // Load Tile background image
    bgImg = loadImage("panda.gif");
    
    // Set tile image name
    imgName = image;
    
    // Set x and y coordinates of the tile
    x = xCoord;
    y = yCoord;
    
    // Set x and y coordinates of the image
    imgX = x + 10;
    imgY = y + 10;
  }
  // ------- Accesor Methods -------
  public int getLength()
  {
    return tLength;
  }
  public int getWidth()
  {
    return tWidth;
  }
  public String getImgName()
  {
    return imgName;
  }
  public PImage getImg()
  {
    return tileImg;
  }
  // Get x coordinate of Tile
  public int getX()
  {
    return x;
  }
  // Get y coordinate of Tile
  public int getY()
  {
    return y;
  }
  
  // ------- Mutator methods -------
  
  // Changes the image of the Tile
  public void editImg(String image)
  {
    tileImg = loadImage(image);
  }
  
  // Change position of tile
  public void editPosition(int xCoord, int yCoord)
  {
    x = xCoord;
    y = yCoord;
  }
  
  // ------- Draw methods -------
  
  /* 
  Draws a Tile object face up, that is, with the image 
  on top of the square background
  */
  
  public void drawFaceUp()
  { 
    /*
    If there is no image in the tile, and/or no coordinates
    provide a warning message
    */
    // TODO
    
    /*
    Tile/image relationship:
    Rectangle must always be drawn first and
    must be bigger than the image, the image size
    is not yet decided but for the sake of this
    prototype we will use 50px by 50px. 
    
    The image should be placed in the center of the
    rectangular background. This can be achieved by 
    setting the image to be 10 units below the rectangle
    and 10 units to the right of the rectangle. 
    */
    
    // Draw sqaure background
    rect(x,y,tWidth,tLength,10);
    
    // Draw Tile image 
    image(tileImg,imgX,imgY);
    
    // Set face up value
    //isFaceUp = true;
  }
  
  /*
  Draws a Tile object face down, that is, without the
  Tile image being shown
  */
  
  public void drawFaceDown()
  {
    // Draw square background
    strokeWeight(3);
    fill(200);
    rect(x,y,tWidth,tLength,12);
    image(bgImg,x+10,y+10);
    
    // Set face up value
   // isFaceUp = false;
  }
  
  // ------- Other methods -------
  
  /*
  Determines if a Tile object is equal to another.
  Two tile objects are equal if they have the same
  (x,y) coordinates and have the same image
  */
  public boolean equals(Tile otherTile)
  {
    // Determine if Tiles have same coordiantes
    boolean test1 = this.getX() == otherTile.getX();
    if(test1 == false) { return false;}
    boolean test2 = this.getY() == otherTile.getY();
    if(test2 == false) { return false;}
    
    // Determine if Tile has the same image
    boolean test3 = this.getImgName() == otherTile.getImgName();
    if(test3 == false) { return false;}
    
    // No other test has returned false, therefore Tiles are equal
    return true;
  }
  
}