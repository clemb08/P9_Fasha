@isTest
public class DataFactory {

    public static void createDataForPricebookFeatures(Integer orderNumber){
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
        
        List<Order> orders = new List<Order>();
        List<OrderItem> items = new List<OrderItem>();
        
        for(Integer i = 0; i < orderNumber; i++) {
            Order o1 = new Order(AccountId = acc1.Id, Status = 'Draft', Pricebook2Id = pbe.Pricebook2Id, EffectiveDate = Date.today());
        	orders.add(o1);
        }
        
        insert orders;
        
        List<Order> insertedOrders = [SELECT Id
                                     FROM Order 
                                      WHERE AccountId = :acc1.Id];
        
        for(Order order : insertedOrders) {
            OrderItem oi1 = new OrderItem (OrderId = order.Id, PricebookEntryId = pbe.Id, Quantity=10, UnitPrice = 150);
            OrderItem oi2 = new OrderItem (OrderId = order.Id, PricebookEntryId = pbe.Id, Quantity=20, UnitPrice = 1000);
            items.add(oi1);
            items.add(oi2);
        }
        

        insert items;
        
        Order o2 = new Order(AccountId = acc2.Id, Status = 'Draft', Pricebook2Id = pbe.Pricebook2Id, EffectiveDate = Date.today());
        insert o2;
        
        OrderItem oi3 = new OrderItem (OrderId = o2.Id, PricebookEntryId = pbe.Id, Quantity=10, UnitPrice = 150);
        insert oi3;
        OrderItem oi4 = new OrderItem (OrderId = o2.Id, PricebookEntryId = pbe.Id, Quantity=20, UnitPrice = 1000);
        insert oi4;
    }
}