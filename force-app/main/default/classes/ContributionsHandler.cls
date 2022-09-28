public class ContributionsHandler {
    @AuraEnabled
    public static List<Integer> getyears(Id contactId){
        List<Contribution__c> dateList = [SELECT Date__c FROM Contribution__c
                                          WHERE Contact__c = :contactId
                                          ORDER BY Date__C DESC];
        List<Integer> yearList = new List<Integer>();
        for(Contribution__c con : dateList){
            Date tempDate = con.Date__c;
            yearList.add(tempDate.year());
        }
        System.debug('yearList'+yearList);
        return yearList;
    }
    
    @AuraEnabled
    public static List<Contribution__c> getContributions(Id contactId){
        List<Contribution__c> contributionList = [SELECT Id, Contact__c, Year__c, Date__c, Name FROM Contribution__c
                                                  WHERE Contact__c = :contactId
                                                  ORDER BY Date__C DESC];
        
        System.debug('yearList'+contributionList);
        return contributionList;
    }
    
    @AuraEnabled
    public static List<String> getJSONFieldSetName(String sObjectName,String sFieldSetName){
        List<String> sFieldSet= new List<String>();
        sFieldSet=getFieldSetName(sObjectName,sFieldSetName);
        return sFieldSet;
    }  
 	
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