({
	init : function(component, event, helper) {
		
        component.set("v.columns", [
            {label: 'Commercial', fieldName: 'Name', type: 'text'},
            {label: 'Montant des commandes', fieldName: 'total', type: 'currency', typeAttributes: { currencyCode: 'EUR', maximumSignificantDigits: 5}}
        ])
        
        const fetchData = component.get("c.sumOdersBySales");
        fetchData.setCallback(this, function(response) {
            console.log(response.getReturnValue());
            let data = response.getReturnValue();
            component.set("v.data", response.getReturnValue());
            let fuck = component.get("v.data");
        });
        
        $A.enqueueAction(fetchData);
	}
})
