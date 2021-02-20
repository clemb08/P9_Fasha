global class BA01_UpdateAllAccounts implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext info){ 
        //Requeter seulement les comptes qui ont au moins une commande avec le Status 'Ordered'
        return Database.getQueryLocator('SELECT Id, Chiffre_d_affaire__c, (SELECT Id, Status, TotalAmount FROM Orders WHERE Status = \'Ordered\') FROM Account WHERE Id IN (SELECT AccountId FROM Order WHERE Status = \'Ordered\')');
 
    }
     
    global void execute(Database.BatchableContext info, List<Account> scope){
        Map<Id,Account> mapAccountIds = new Map<Id,Account>(scope);
        AP01_AccountUpdate.updateChiffreAffaire(mapAccountIds);
    }    
     
    global void finish(Database.BatchableContext info){     
        
    } 
 }