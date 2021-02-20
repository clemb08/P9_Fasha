@isTest
public class VF01_MyTeamOrdersControllerTest {

    @testSetup
    static void setup() {
    	DataFactory.createDataForPricebookFeatures();
        
        Order order = [SELECT Id, Status FROM Order LIMIT 1];
        order.Status = 'Ordered';
        update order;
    }
    
    public static testmethod void testMyTeamOrdersController () {
        VF01_MyTeamOrdersController cont = new VF01_MyTeamOrdersController();
        System.assertEquals(cont.Sumorders, 43000);
    }
    
}