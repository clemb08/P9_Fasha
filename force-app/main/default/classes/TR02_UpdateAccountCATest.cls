@isTest
private class TR02_UpdateAccountCATest {
    @isTest static void testTriggerUpdateAccountCA() {
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
        
        Account accResult = [SELECT Id, Chiffre_d_affaire__c 
                             FROM Account
                            WHERE Name = 'Test Account 1'];
        
        System.assertEquals(21500, accresult.Chiffre_d_affaire__c);
    }
}