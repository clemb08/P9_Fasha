@isTest
public class DataFactory {

    public static void createDataForPricebookFeatures(){
        Account acc1 = new Account(Name = 'Test Account 1');
        insert acc1;
        
        Account acc2 = new Account(Name = 'Test Account 2');
        insert acc2;

        Product2 pd1 = new Product2(Name = 'Chemise Verte longue XYX', Family = 'Chemise');
        Insert pd1;
 
        //Create the PricebookEntry
        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = pd1.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert pbe;

        Order o1 = new Order(AccountId = acc1.Id, Status = 'Draft', Pricebook2Id = pbe.Pricebook2Id, EffectiveDate = Date.today());
        insert o1;
        
        Order o2 = new Order(AccountId = acc2.Id, Status = 'Draft', Pricebook2Id = pbe.Pricebook2Id, EffectiveDate = Date.today());
        insert o2;

        OrderItem oi1 = new OrderItem (OrderId = o1.Id, PricebookEntryId = pbe.Id, Quantity=10, UnitPrice = 150);
        insert oi1;
        OrderItem oi2 = new OrderItem (OrderId = o1.Id, PricebookEntryId = pbe.Id, Quantity=20, UnitPrice = 1000);
        insert oi2;
        OrderItem oi3 = new OrderItem (OrderId = o2.Id, PricebookEntryId = pbe.Id, Quantity=10, UnitPrice = 150);
        insert oi3;
        OrderItem oi4 = new OrderItem (OrderId = o2.Id, PricebookEntryId = pbe.Id, Quantity=20, UnitPrice = 1000);
        insert oi4;
    }
}