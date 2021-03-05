@isTest
public class CT01_MyTeamOrdersControllerTest {

     @isTest static void testOrdersBySales() {
        
        DataFactory.createDataForPricebookFeatures();
         
        Test.startTest();
       	List<AggregateResult> groupedResults = CT01_MyTeamOrdersController.sumOrdersBySales();
        Test.stopTest();
         
        System.assertEquals(43000, groupedResults[0].get('total'));
        
     }
}