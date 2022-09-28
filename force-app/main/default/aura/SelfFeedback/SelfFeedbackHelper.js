({
	doInitHelper: function(component){
        var action = component.get('c.getFeddbacksWihtDesig');
        action.setParams({
            "designationId": component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
                var result = response.getReturnValue();
                component.set("v.feedbackList", result);
            }else{
                alert('ERROR');
            }
        });
        
        $A.enqueueAction(action);        
    },
    
    fieldSet: function(component){
        var action = component.get("c.getFieldSetName");
        action.setParams({
            "sObjectName":"Feedback__c",
            "fieldSetName": "feedbackFields" // component.get("v.horizontalfieldSet")
        })
        action.setCallback(this, function(response) {  
            var fieldsApiName = response.getState();
            if(response.getState()=="SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.displayFields", result);
            }
            else{
                console.log(response.getError());
            }
        })
        $A.enqueueAction(action);
    }
})