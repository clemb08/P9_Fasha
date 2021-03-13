trigger CalculMontantNetAmount on Order (before update) {
	//Iteration through several orders
    for(Order order : trigger.new) {
        //Calculation NetAmount field
        order.NetAmount__c = order.TotalAmount - order.ShipmentCost__c;
    }
}