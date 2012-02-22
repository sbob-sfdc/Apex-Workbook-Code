Integer[] myList = new List<Integer>{10, 20};
// Modify the value of the first element 
// using the array notation 
myList[0] = 15; 
// or using the set method 
myList.set(0,15);
System.debug ('Updated value:' + myList[0]);
// Return the size of the list 
System.debug ('List size: ' + myList.size());