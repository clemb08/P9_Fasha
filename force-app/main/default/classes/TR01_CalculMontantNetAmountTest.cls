@isTest
public class TR01_CalculMontantNetAmountTest {

     @isTest static void testTriggerCalculMontantNetAmount() {
            
            DataFactory.createDataForPricebookFeatures(2);
                
            List<Order> updateOrder = [SELECT Id, Status 
                                 FROM Order
                                 WHERE Account.Name = 'Test Account 1'];
            
            for(Order order: updateOrder) {
                order.Status = 'Ordered';
            }
            
         	//Test trigger through update
            Test.startTest();
            update updateOrder;
            Test.stoptest();
            
            List<Order> orderResult = [SELECT Id, NetAmount__c
                                 FROM Order
                                WHERE Account.Name = 'Test Account 1'];
            
            System.assertEquals(21500, orderResult[0].NetAmount__c);
        }
    
    	//test with more than 200 orders
        @isTest static void testTriggerCalculMontantNetAmountUpToLimits() {
            
            DataFactory.createDataForPricebookFeatures(201);
                
            List<Order> updateOrder = [SELECT Id, Status 
                                 FROM Order
                                 WHERE Account.Name = 'Test Account 1'];
            
            for(Order order: updateOrder) {
                order.Status = 'Ordered';
            }
            
            Test.startTest();
            update updateOrder;
            Test.stoptest();
            
            List<Order> orderResult = [SELECT Id, NetAmount__c
                                 FROM Order
                                WHERE Account.Name = 'Test Account 1'];
            
            System.assertEquals(21500, orderResult[0].NetAmount__c);
        }
}