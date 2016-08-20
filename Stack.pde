/*
Represents the Stack data structure
Each Stack contains an element (object).
*/

class Stack
{
  /*
  Node class, used to implement the Stack
  */
  private class Node
  {
    // Holds piece of Data stored in a Node
    public Object data;
    // Holds Pointer to next node
    public Node next;
    // Constructor
    public Node(Object element, Node nextNode)
    {
      data = element;
      next = nextNode;
    }
  }
  
  // Holds top Node
  private Node topNode = null;
  
  // Push an item to the top of the Stack
  public void push(Object item)
  {
    topNode = new Node(item,topNode);
  }
  
  // Pop an item from the top of the Stack
  public Object pop()
  {
    // Holds item data
    Object item = peek();
    // Change top Node
    topNode = topNode.next;
    return item;
  }
  
  // Get top item in the Stack without popping
  // CALLER MUST CHECK FOR NULL!!!
  public Object peek()
  {
    if(topNode == null)
    {
      return null;
    }
    else
    {
      return topNode.data;
    }
  }
  
  // Determine if Stack is empty
  boolean isEmpty()
  {
    if(topNode == null)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  // Get size of Stack
  public int size()
  {
    // Holds size of Stack
    int counter = 0;
    
    // Iterate through stack
    Node temp = topNode;
    while(temp != null)
    {
      ++counter;
      temp = temp.next;
    }
    
    return counter;
  }
  
}