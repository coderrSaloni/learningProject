public class SelfFeedbackHandler {
    @AuraEnabled(cacheable=true)
    public static List<Feedback__c> getFeddbacksWihtDesig(Id designationId){
        Id contactId = MVPNomineeBasicInfoHandler.getContactId(designationId);
        List<Feedback__c> feedbackList = [SELECT Id, Year__c FROM Feedback__c
                                          WHERE Nominator__c=: contactId
                                         ORDER BY Year__c DESC];
        System.debug('feedbackList>>>> '+ feedbackList);
        return feedbackList;
    }    
    //---------------------------------//

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
}