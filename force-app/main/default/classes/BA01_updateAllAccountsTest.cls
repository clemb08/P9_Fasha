@isTest
public class BA01_updateAllAccountsTest {

    @testSetup
    static void setup() {
    	DataFactory.createDataForPricebookFeatures(2);
        
        Order order = [SELECT Id, Status FROM Order LIMIT 1];
        order.Status = 'Ordered';
        update order;
    }
    
     @isTest static void testExecuteBatch() {
        Test.startTest();
        BA01_updateAllAccounts uaa = new BA01_updateAllAccounts();
        Id batchId = Database.executeBatch(uaa);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        List<Account> accountsAfter = [SELECT Id, Chiffre_d_affaire__c, (SELECT Id, Status, TotalAmount FROM Orders WHERE Status = 'Ordered') 
                                  FROM Account 
                                  WHERE Id IN (SELECT AccountId FROM Order WHERE Status = 'Ordered')];
        
        System.assertEquals(21500, accountsAfter[0].Chiffre_d_affaire__c );
    }
}