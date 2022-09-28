({    
    doInit: function(component, event, helper){
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