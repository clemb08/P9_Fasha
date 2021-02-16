trigger CalculMontantNetAmount on Order (before update) {
	
    for(Order order : trigger.new) {
        order.NetAmount__c = order.TotalAmount - order.ShipmentCost__c;
    }
}