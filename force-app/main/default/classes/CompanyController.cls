public without sharing class CompanyController {
    @AuraEnabled(cacheable=true)
    public static List<Account> companiesData(){
        return [SELECT Name, About__c, recordUrl__c FROM Account WHERE Location__c != NULL Order By Name ASC];
    }
}