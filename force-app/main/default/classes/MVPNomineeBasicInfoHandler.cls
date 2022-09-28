public class MVPNomineeBasicInfoHandler {
	@AuraEnabled(cacheable=true)
    public static List<String> getJSONFieldSetName(String sObjectName,String sFieldSetName){
        List<String> sFieldSet= new List<String>();
        sFieldSet=getFieldSetName(sObjectName,sFieldSetName);
        return sFieldSet;
    }  
 	
    @AuraEnabled(cacheable=true)
    public static List<String> getFieldSetName(String sObjectName,String fieldSetName) {
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
    
    @AuraEnabled(cacheable=true)
    public static Id getContactId(String designationId){
        List<Designation__c> conId = [SELECT Contact__c FROM Designation__c
                   WHERE Id=: designationId];
        Id contactId;
        for(Designation__c d : conId){
            contactId = d.Contact__c;
        }
        System.debug('conId>>> '+ contactId);
        return contactId;
    }
}