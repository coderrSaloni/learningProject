public with sharing class GetFieldSetName {
    @AuraEnabled(cacheable=true)
    public static List<String> getFieldsNameFromFieldSet(String sObjectName,String fieldSetName) {
        List<String> fieldApiList = new List<String>();
        
        SObjectType objToken = Schema.getGlobalDescribe().get(sObjectName);
        Schema.DescribeSObjectResult d = objToken.getDescribe();
        Map<String, Schema.FieldSet> FsMap = d.fieldSets.getMap();
        system.debug('>>>>>>> FsMap >>> ' + FsMap);
        if(FsMap.containsKey(fieldSetName))
            for(Schema.FieldSetMember f : FsMap.get(fieldSetName).getFields()) {
                fieldApiList.add(f.getFieldPath());
            }
        //f.getFieldPath()
        system.debug('>>fieldApiList >>> ' + fieldApiList);
        return fieldApiList;
    }
}
