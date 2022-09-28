({    
    doInit: function(component, event, helper){
        var action = component.get('c.getyears');
        action.setParams({
            "contactId": component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS' && component.isValid()){
                var result = response.getReturnValue();
                component.set("v.year", result);
            }else{
                alert('ERROR');
            }
        });
        $A.enqueueAction(action);
        helper.doInitHelper(component);
        
        helper.gethorizontalfieldSet(component);
        helper.getverticalfieldSet(component);
        helper.getdetailfieldSet(component);
    },
    
    handleClick: function(component, event){
        //eval("$A.get('e.force:refreshView').fire();");
        $A.get("e.force:refreshView").fire();
    },
    
    /*
    getFieldSet: function(component, event, helper){
        helper.gethorizontalfieldSet(component);
        helper.getverticalfieldSet(component);
        helper.getdetailfieldSet(component);
    }*/
})