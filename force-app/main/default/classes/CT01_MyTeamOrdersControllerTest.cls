@isTest
public class CT01_MyTeamOrdersControllerTest {

     @isTest static void testOrdersBySales() {
        
        DataFactory.createDataForPricebookFeatures(2);
         
        Order order = [SELECT Id, Status FROM Order LIMIT 1];
        order.Status = 'Ordered';
        update order;
         
        Test.startTest();
       	List<AggregateResult> groupedResults = CT01_MyTeamOrdersController.sumOrdersBySales();
        Test.stopTest();
         
        System.assertEquals(21500, groupedResults[0].get('total'));
        
     }
}