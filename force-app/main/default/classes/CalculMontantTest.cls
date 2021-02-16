@isTest
public class CalculMontantTest {

        @isTest static void testTriggerCalculMontantNetAmount() {
        Account acc1 = new Account(Name = 'Test Account 1');
        insert acc1;

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

        Order o1 = new Order(AccountId = acc1.Id, Status = 'Draft', Pricebook2Id = pbe.Pricebook2Id, EffectiveDate = Date.today(), ShipmentCost__c = 100);
        insert o1;

        OrderItem oi1 = new OrderItem (OrderId = o1.Id, PricebookEntryId = pbe.Id, Quantity=10, UnitPrice = 150);
        insert oi1;
        OrderItem oi2 = new OrderItem (OrderId = o1.Id, PricebookEntryId = pbe.Id, Quantity=20, UnitPrice = 1000);
        insert oi2;
        
        Order updateOrder = [SELECT Id, Status 
                             FROM Order
                          	 WHERE AccountId = :acc1.Id];
        updateOrder.Status = 'Ordered';
        
        Test.startTest();
        update updateOrder;
        Test.stoptest();
        
        Order orderResult = [SELECT Id, NetAmount__c
                             FROM Order
                            WHERE AccountId = :acc1.Id];
        
        System.assertEquals(21400, orderResult.NetAmount__c);
    }
}