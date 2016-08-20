import java.util.*;

/*
A class that simulates an ordered pair.
Each Cartesian object has 2 integers, an x
coordinate and a y coordinate. Also contains
a boolean variable that determines if the 
object is "empty" or not. True is empty,
false is not empty. A Cartesian object 
is empty when it has been initialized
through the default constructor, otherwise
it is not empty.

The empty variable is mainly used for 
validation, if an object is empty then 
we can consider it to be invalid. Once 
either the X value or the Y value has been
changed the object is valid. 
*/
class Cartesian
{
  // ------- Instance variables -------
  private int xValue;
  private int yValue;
  private boolean empty;
  
  // ------- Constructor  -------
  public Cartesian(int x, int y)
  {
    xValue = x;
    yValue = y;
    empty = false;
  }
  
  public Cartesian()
  {
    empty = true;
  };
  
  // ------- Accessor methods -------
  public int getXCoord()
  {
    return xValue;
  }
  public int getYCoord()
  {
    return  yValue;
  }
  public boolean isEmpty()
  {
    return empty;
  }
  public String toString()
  {
    return "(" + xValue + "," + yValue + ")";
  }
  
  // ------- Mutator methods -------
  public void setXCoord(int newX)
  {
    xValue = newX;
    empty = false;
  }
  public void setYCoord(int newY)
  {
    yValue = newY;
    empty = false;
  }
  public void setStatus(boolean bool)
  {
    empty = bool;
  }
  
  // ------- Other methods -------
 
  /*
  Compares one Cartesian object to another.
  Two Cartesian objects are equal when they 
  have the same x and y coordinates.
  */
  public boolean equals(Cartesian otherObject)
  {
    // Check x coordiantes for equality
    boolean test1 = this.getXCoord() == otherObject.getXCoord();
    // Not equal
    if(!test1) { return false; }
    
    // Check y coordinates for equality
    boolean test2 = this.getYCoord() == otherObject.getYCoord();
    // Not equal
    if(!test2) { return false; }
    
    // No test has returned false, objects must be equal
    return true;
  }
  
  /*
  Generates random x and y values for a Carteisan object.
  Values are generated from the range specified, that is,
  from 0 (inclusive) to bound (exclusive)
  */
  public void setRandom(int bound)
  {
    // Create a new Random object
    Random rand = new Random();
    
    // Generate a Random x value
    int randXVal = rand.nextInt();
    // Get absolute value
    randXVal = Math.abs(randXVal);
    randXVal %= bound;
    // Set new value
    setXCoord(randXVal);
    
    // Generate a Random y value
    int randYVal = rand.nextInt();
    // Get absolute value
    randYVal = Math.abs(randYVal);
    randYVal %= bound;
    // Set new value
    setYCoord(randYVal);
  }
}