({
    handleSubmit : function(cmp, event, helper) {
        event.preventDefault();       // stop the form from submitting
        const fields = event.getParam('fields');
        cmp.find('myRecordForm').submit(fields);
    },
    
    doInit: function(component, event, helper) {                       
        helper.getFieldSet(component);
    },
    
    getConId : function(component){
        var action = component.get("c.getContactId");
        action.setParams({
            "designationId" : component.get("v.recordId")
        })
        action.setCallback(this, function(response) {  
            var contactId = response.getState();
            if(response.getState()=="SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.contactId", result);
            }
            else{
                console.log(response.getError());
            }
        })
        $A.enqueueAction(action);
    }
})