public class Fridge { 
    public String modelNumber; 
    public Integer numberInStock;
    
    public void hasSold(Integer justSold) {
        numberInStock = numberInStock - justSold;
    }
}