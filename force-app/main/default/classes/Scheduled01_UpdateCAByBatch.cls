global class Scheduled01_UpdateCAByBatch implements Schedulable {
  global void execute(SchedulableContext sc) {
      //Instanciation of the Batch Class
      BA01_updateAllAccounts updateAccounts = new BA01_updateAllAccounts();
      //Execution of the Batch Class
      database.executeBatch(updateAccounts, 200);
  }
}