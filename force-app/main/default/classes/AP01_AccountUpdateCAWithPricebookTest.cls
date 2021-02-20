@isTest
public class AP01_AccountUpdateCAWithPricebookTest {

    @isTest static void updateChiffreAffaire() {
        
        DataFactory.createDataForPricebookFeatures();
       
        Order order = [SELECT Id, Status FROM Order LIMIT 1];
        order.Status = 'Ordered';
        update order;
        
        List<Account> accounts = [SELECT Id, Chiffre_d_affaire__c, (SELECT Id, Status, TotalAmount FROM Orders WHERE Status = 'Ordered') 
                                  FROM Account 
                                  WHERE Id IN (SELECT AccountId FROM Order WHERE Status = 'Ordered')];
        
        Map<Id,Account> mapAccountIds = new Map<Id,Account>(accounts);
        
        Test.startTest();
        AP01_AccountUpdateCAWithPricebook.updateChiffreAffaire(mapAccountIds);
        Test.stopTest();
        
        List<Account> accountsAfter = [SELECT Id, Chiffre_d_affaire__c, (SELECT Id, Status, TotalAmount FROM Orders WHERE Status = 'Ordered') 
                                  FROM Account 
                                  WHERE Id IN (SELECT AccountId FROM Order WHERE Status = 'Ordered')];
        
        System.assertEquals(21500, accountsAfter[0].Chiffre_d_affaire__c );
    }
    
}