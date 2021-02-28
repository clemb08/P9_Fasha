public class CT01_MyTeamOrdersController {
    
    @AuraEnabled
    public static List<AggregateResult> sumOdersBySales(){
			List<AggregateResult> groupedResults = [SELECT Owner.Name, SUM(TotalAmount) total FROM Order GROUP BY Owner.Name];
			return groupedResults;
    }

}