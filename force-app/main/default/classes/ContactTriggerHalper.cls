public class ContactTriggerHalper {
    public static void setOthersContactNotPrime(Id actId, Id conId){
        //Contacts on a particular Account
        List<Contact> contacts = [SELECT Id, IsPrimary__c FROM Contact
                                 WHERE Id NOT IN (:conId) AND IsPrimary__c = true AND AccountId =: actId];
        // Blank List to Update Contact
        List<Contact> conToUpdate = new List<Contact>();
        // loop on **Contacts on a particular Account** List
        for(Contact con : contacts){
            con.IsPrimary__c = false;
            conToUpdate.add(con);
        }
        update conToUpdate; // update contacts
        // ContactTriggerHalper.updateEmail(actId, conId);
    }
    
    public static void updateEmail(Id actId, Id conId){
        Contact con = [SELECT Id, IsPrimary__c, Email FROM Contact
                       WHERE Id =: conId AND IsPrimary__c = true AND AccountId =: actId];
        List<Account> acct = [SELECT Id, Primary_Contact_Email__c FROM Account
                              WHERE Id =: actId];
 
        List<Account> acctsToUpdate = new List<Account>();
        for(Account a : acct){
            a.Primary_Contact_Email__c = con.Email;
            acctsToUpdate.add(a);
        }
        update acctsToUpdate;
    }
    
    public static void countAccount(List<Contact> newList){
        Integer count;
        Set<Id> acctIds = new Set<Id>();
        
        for(Contact con : newList){
            if(con.AccountId != null){
                acctIds.add(con.AccountId);
            }
        }
        
        List<Account> accounts = [SELECT Id, Count__c, (SELECT Id FROM Contacts) FROM Account
                                 WHERE Id IN :acctIds];
        
        if(!accounts.isEmpty()){
            for(Account acc : accounts){
                acc.Count__c = acc.Contacts.size();
            }
        }
        update accounts;
    }
}