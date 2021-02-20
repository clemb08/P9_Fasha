global class Scheduled01_UpdateCA implements Schedulable {
  global void execute(SchedulableContext sc) {
      BA01_updateAllAccounts updateAccounts = new BA01_updateAllAccounts(); 
      database.executeBatch(updateAccounts, 200);
  }
}