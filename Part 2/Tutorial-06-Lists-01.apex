Integer[] myList = new List<Integer>(); 
//Adds a new element with value 10 to the end of the list 
myList.add(10);
// Retrieve the first element of the list 
// using array notation 
Integer i = myList[0]; 
// or using the get method
Integer j = myList.get(0); 
System.debug('First element in the array using myList[0] is ' + i);
System.debug('First element in the array using myList.get(0) is ' + j);