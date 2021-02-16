global class Scheduled01_UpdateCA implements Schedulable {
  global void execute(SchedulableContext sc) {
      UpdateAllAccounts updateAccounts = new UpdateAllAccounts(); 
      database.executeBatch(updateAccounts, 200);
  }
}