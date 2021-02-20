public class VF01_MyTeamOrdersController {
    public decimal SumOders{
        get{
			AggregateResult groupedResults = [SELECT SUM(TotalAmount) total FROM Order];
			return (decimal)groupedResults.get('total');

        }
        set;
    }
}