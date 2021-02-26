@isTest
public class Scheduled01_UpdateCAByBatchTest {

    @testSetup
    static void setup() {
    	DataFactory.createDataForPricebookFeatures();
        
        Order order = [SELECT Id, Status FROM Order LIMIT 1];
        order.Status = 'Ordered';
        update order;
    }
    
     @isTest static void testScheduledUpdateCA() {
        Test.startTest();
        Scheduled01_UpdateCA scheUpdateCA = new Scheduled01_UpdateCA(); 
		String sch ='0 48 * * * ?'; 
		System.schedule('Schedule to update Account CA', sch, scheUpdateCA);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        List<Account> accountsAfter = [SELECT Id, Chiffre_d_affaire__c, (SELECT Id, Status, TotalAmount FROM Orders WHERE Status = 'Ordered') 
                                  FROM Account 
                                  WHERE Id IN (SELECT AccountId FROM Order WHERE Status = 'Ordered')];
        
        System.assertEquals(21500, accountsAfter[0].Chiffre_d_affaire__c );
    }
}