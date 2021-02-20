@isTest
private class TR02_UpdateAccountCATest {
    @isTest static void testTriggerUpdateAccountCA() {
        DataFactory.createDataForPricebookFeatures();
        
        Order updateOrder = [SELECT Id, Status 
                             FROM Order
                          	 WHERE Account.Name = 'Test Account 1'];
        updateOrder.Status = 'Ordered';
        
        Test.startTest();
        update updateOrder;
        Test.stoptest();
        
        Account accResult = [SELECT Id, Chiffre_d_affaire__c 
                             FROM Account
                            WHERE Name = 'Test Account 1'];
        
        System.assertEquals(21500, accresult.Chiffre_d_affaire__c);
    }
}