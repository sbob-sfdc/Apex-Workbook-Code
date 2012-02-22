Fridge myFridge = new Fridge(); 
myFridge.modelNumber = 'MX-O'; 
myFridge.numberInStock = 100; 
myFridge.hasSold(20);
Fridge myOtherFridge = new Fridge(); 
myOtherFridge.modelNumber = 'MX-Y'; 
myOtherFridge.numberInStock = 50; 
System.debug('myFridge.numberInStock=' + myFridge.numberInStock); System.debug('myOtherFridge.numberInStock=' + myOtherFridge.numberInStock);