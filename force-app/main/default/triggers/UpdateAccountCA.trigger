trigger UpdateAccountCA on Order (after update) {
	
    List<Account> accountsToUpdate = new List<Account>();
    
    for(Order order : Trigger.new){
        if(order.Status == 'Ordered') {
            Account acc = [SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id =:order.AccountId ];
            acc.Chiffre_d_affaire__c = acc.Chiffre_d_affaire__c + order.TotalAmount;
            accountsToUpdate.add(acc);
        }
    }
    
    if(accountsToUpdate.size() > 0){
    	update accountsToUpdate;
    }

}