public class ContributionsOnDesignation {
	@AuraEnabled(cacheable=true)
    public static List<Contribution__c> getContributionsWihtDesig(Id designationId){
        Id contactId = MVPNomineeBasicInfoHandler.getContactId(designationId);
        List<Contribution__c> contributionList = getContributions(contactId);
        return contributionList;
    }
    
    public static List<Contribution__c> getContributions(Id contactId){
        List<Contribution__c> contributionList = [SELECT Id, Contact__c, Year__c, Date__c, Name FROM Contribution__c
                                                  WHERE Contact__c = :contactId
                                                  ORDER BY Date__C DESC];
        
        System.debug('yearList'+contributionList);
        return contributionList;
    }
    // -------------------------------------------------- //
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
}