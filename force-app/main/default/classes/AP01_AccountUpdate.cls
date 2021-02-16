public class AP01_AccountUpdate {

  public static void updateChiffreAffaire(Map<Id,Account> accounts) {
    
      List<Account> accountsToUpdate = new List<Account>();
      
      for(Id id : accounts.keyset()){
         Account account = accounts.get(id);
         for(Order order : account.Orders){
                 account.Chiffre_d_affaire__c += order.TotalAmount;                
         }
         
         accountsToUpdate.add(account);
       }
     
     update accountsToUpdate;
  }
}