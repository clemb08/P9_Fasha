@isTest
public class AP02_UpdateCAWithOrdersTest {
 
   @isTest static void testupdateCAWithOrdersTotalAmount() {
        DataFactory.createDataForPricebookFeatures(2);
        
        List<Order> updateOrder = [SELECT Id, Status, AccountId, TotalAmount
                             FROM Order
                          	 WHERE Account.Name = 'Test Account 1'];
        
        for(Order order: updateOrder) {
        	order.Status = 'Ordered';
        }
       
       update updateOrder;

        
        Test.startTest();
        AP02_UpdateCAWithOrders.updateCAWithOrdersTotalAmount(updateOrder);
        Test.stoptest();
        
        Account accResult = [SELECT Id, Chiffre_d_affaire__c 
                             FROM Account
                            WHERE Name = 'Test Account 1'];
        
        System.assertEquals(43000, accresult.Chiffre_d_affaire__c);
    }
}