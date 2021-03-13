public class AP01_AccountUpdateCAWithPricebook {

  public static void updateChiffreAffaire(Map<Id,Account> accounts) {
    
      List<Account> accountsToUpdate = new List<Account>();
      
      //Iteration through map accounts to update the CA
      for(Id id : accounts.keyset()){
         Account account = accounts.get(id);
         Decimal sum = 0;
         for(Order order : account.Orders){
                 sum += order.TotalAmount;                
         }
         account.Chiffre_d_affaire__c = sum;
          //Add the accounts to a list
         accountsToUpdate.add(account);
       }
     //Update out of the for loop
     update accountsToUpdate;
  }
}