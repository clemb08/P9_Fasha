public class CT01_MyTeamOrdersController {
    
    @AuraEnabled
    public static List<AggregateResult> sumOrdersBySales(){
        	//Return a Aggregate object of Orders grouped by Owner and filtered by Status
			List<AggregateResult> groupedResults = [SELECT Owner.Name, SUM(TotalAmount) total FROM Order WHERE Status = 'Ordered' GROUP BY Owner.Name];
			return groupedResults;
    }

}