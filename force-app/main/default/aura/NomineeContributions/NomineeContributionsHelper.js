({
	doInitHelper: function(component){
        var action = component.get('c.getContributionsWihtDesig');
        action.setParams({
            "designationId": component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
                var result = response.getReturnValue();
                component.set("v.conList", result);
            }else{
                alert('ERROR');
            }
        });
        
        $A.enqueueAction(action);        
    },
    
    gethorizontalfieldSet: function(component){
        var action = component.get("c.getJSONFieldSetName");
        action.setParams({
            "sObjectName":"Contribution__c",
            "sFieldSetName": component.get("v.horizontalfieldSet")
        })
        action.setCallback(this, function(response) {  
            var fieldsApiName = response.getState();
            if(response.getState()=="SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.horizontalFields", result);
                /*var fieldSetObj = JSON.parse(response.getReturnValue());                
                component.set("v.fieldSetValues", fieldSetObj);
                console.log('get fieldset=>'+JSON.stringify(fieldSetObj));*/
            }
            else{
                console.log(response.getError());
            }
        })
        $A.enqueueAction(action);
    },
    
    getverticalfieldSet: function(component){
        var action = component.get("c.getJSONFieldSetName");
        action.setParams({
            "sObjectName":"Contribution__c",
            "sFieldSetName": component.get("v.verticalfieldSet")
        })
        action.setCallback(this, function(response) {  
            var fieldsApiName = response.getState();
            if(response.getState()=="SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.verticalFields", result);
            }
            else{
                console.log(response.getError());
            }
        })
        $A.enqueueAction(action);
    },
    
    getdetailfieldSet: function(component){
        var action = component.get("c.getJSONFieldSetName");
        action.setParams({
            "sObjectName":"Contribution__c",
            "sFieldSetName": component.get("v.detailfieldSet")
        })
        action.setCallback(this, function(response) {  
            var fieldsApiName = response.getState();
            if(response.getState()=="SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.detailFields", result);
            }
            else{
                console.log(response.getError());
            }
        })
        $A.enqueueAction(action);
    },
})