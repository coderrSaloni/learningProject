({
	getFieldSet :function(component){
        var action = component.get("c.getJSONFieldSetName");
        action.setParams({
            "sObjectName":"Contact",
            "sFieldSetName": component.get("v.fieldSet")
        })
        action.setCallback(this, function(response) {  
            var fieldsApiName = response.getState();
            if(response.getState()=="SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.mvpBasicFields", result);
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
})