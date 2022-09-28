({
	doInit: function(component, event, helper){
        helper.doInitHelper(component);
        helper.fieldSet(component);
    },
    
    handleClick: function(component, event){
        //eval("$A.get('e.force:refreshView').fire();");
        $A.get("e.force:refreshView").fire();
    }
})