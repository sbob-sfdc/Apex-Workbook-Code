public class TransactionExample {
    public static void PurchaseMerchandise() {
        // Retrieve the pencils sample merchandise
        Merchandise__c[] m = [SELECT Price__c,Total_Inventory__c 
                              FROM Merchandise__c WHERE Name='Pencils'];
        System.assert(m.size() > 0);
        Merchandise__c pencils = m[0];   
    
        // Add a new invoice
        Invoice_Statement__c inv = new Invoice_Statement__c(
                                      Description__c='Transaction Invoice');
        insert inv;
    
        // Add a new line item to the invoice
        Line_Item__c li = new Line_Item__c(
                        Invoice_Statement__c = inv.Id, 
                        Merchandise__c = pencils.Id, 
                        Unit_Price__c = pencils.Price__c, 
                        Units_Sold__c = 1500);
        insert li;
    }
}

public class merchandiseOperations {
    public static Id invoice( String pName, Integer pSold, String pDesc) {
        // Retrieve the pencils sample merchandise
        Merchandise__c m = [SELECT Price__c,Total_Inventory__c
            FROM Merchandise__c WHERE Name = :pName LIMIT 1];
        // break if no merchandise is found
        System.assertNotEquals(null, m);
        // Add a new invoice
        Invoice_Statement__c i = new Invoice_Statement__c(
            Description__c = pDesc);
        insert i;

        // Add a new line item to the invoice
        Line_Item__c li = new Line_Item__c(
            Name = '1',
            Invoice_Statement__c = i.Id,
            Merchandise__c = m.Id,
            Unit_Price__c = m.Price__c,
            Units_Sold__c = pSold);
        insert li;

        // Update the inventory of the merchandise item 
        m.Total_Inventory__c -= pSold;
        update m;
        return i.Id;
    }
}

Id invoice = merchandiseOperations.invoice('Pencils', 5000, 'test 1');
Id invoice = merchandiseOperations.invoice('Pencils', 5, 'test 2');
