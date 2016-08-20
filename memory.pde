// Create a new MemoryGame object
MemoryGame game1;

// Holds position of Tile that mouse hovers over or clicks on 
Cartesian tilePosition = new Cartesian();
   
// Holds coordiantes of mouse
int mouseXVal;
int mouseYVal;

void setup()
{   
   // Set size of background window
   size(400,400);
   
   // Set color of background window
   background(240);
   
   // Create a new MemoryGame object
   game1 = new MemoryGame(4,4);
      
   // Show initial gameBoard
   game1.showGameBoard(); 
   
   // Prompt User 
   println("Weclome to memory!");
}

void draw()
{  
    if(game1.getCurrentTiles() == 2)
     {
       //println("Lets go!");
       delay(700);
       if(game1.isMatch())
       {
         println("Match!");
       }
       else
       {
         println("No match!");
       }
     }
     
   // Get mouse values
   mouseXVal = mouseX;
   mouseYVal = mouseY;
   
   if(mousePressed)
   {
     // Find position of Tile associated with mouse values
     tilePosition = game1.processMouse(mouseXVal,mouseYVal);
     noLoop();
     
     if(!tilePosition.isEmpty())
       {  
          // Get x and y values
          int tileX = tilePosition.getXCoord();
          int tileY = tilePosition.getYCoord();
              
          // Make changes to gameBoard
          game1.updateGameBoard(tileX,tileY);
       }
   }
}

void mouseReleased()
{  
  loop();
}