public class Fridge { 
    private String modelNumber; 
    private Integer numberInStock;
    
    public void hasSold(Integer justSold) {
        numberInStock = numberInStock - justSold;
    }
    
    public void setModelNumber(String theModelNumber) {
        modelNumber = theModelNumber;
    }
    
    public String getModelNumber () {
        return modelNumber;
    } 
}