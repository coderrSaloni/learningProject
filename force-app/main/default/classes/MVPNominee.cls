public class MVPNominee {
	@AuraEnabled
    public static List<Contact> getContactsHorizontalFields(Id conId){
        List<Contact> cons = [SELECT (SELECT Name, Pillars__c, Assessment__c FROM Contributions__r) FROM Contact
                             WHERE Id=:conId];
        return cons;
    }
    @AuraEnabled
    public static List<Contribution__c> getContacts(){
        List<Contribution__c> contactList = [SELECT Name, Pillars__c, Assessment__c FROM Contribution__c LIMIT 10];
        return contactList; 
    }
    
    @AuraEnabled
    public static List<Contribution__c> getYear(Id contributionId){
        List<Contribution__c> dateList = [SELECT Date__c FROM Contribution__c
                                         WHERE Id=: contributionId];
        return dateList; 
    }
}