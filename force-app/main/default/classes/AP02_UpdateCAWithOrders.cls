public class AP02_UpdateCAWithOrders {
    
    public static void updateCAWithOrdersTotalAmount(List<Order> orders) {
        
        Set<Id> accounts = new Set<Id>();
        List<Order> ordered = new List<Order>();
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
        
        //Iteration through the List of orders to filtered accounts and Ordered Order
        for(Order order : orders){
            if(order.Status == 'Ordered') {
            	accounts.add(order.AccountId);
                ordered.add(order);
            }
        }
        
        //Get the accounts
        List<Account> accountsList = [SELECT Id, Chiffre_d_affaire__c
                                FROM Account
                                WHERE Id IN :accounts];
        
        //Iterate through accounts
        for(Account acc : accountsList) {
            for(Order order : ordered) {
                if(order.AccountId == acc.Id) {
                    //Update Chiffre_d_affaire__c field and add the account to the List
                    if(accountsToUpdate.get(acc.Id) != null){
                        accountsToUpdate.get(acc.Id).Chiffre_d_affaire__c += order.TotalAmount;
                    } else {
                        accountsToUpdate.put(acc.Id, acc);
                    }
                }
                
            }
        }
        
        //Update the List of accounts if not empty
        if(accountsToUpdate.size() > 0){
            update accountsToUpdate.values();
        }
    }
    
}