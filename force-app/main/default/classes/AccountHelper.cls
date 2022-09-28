public with sharing class AccountHelper {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Type, Rating,
                Phone, Website, AnnualRevenue
                FROM Account];
    }

    @AuraEnabled(cacheable=true)
    public static List<String> sList(String a, String b) {
        List<String> tempList = new List<String>();
        for (Integer i=0; i<10; i++) {
            tempList.add(a+' '+b+' '+i);
        }
        return tempList;
    }
}