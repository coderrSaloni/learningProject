@isTest
public class ContactTriggerTest {
    @isTest
    static void testIsPrime(){
        Account acct = new Account(Name='Test acc');
        insert acct;
        
        /*Contact con1 = new Contact(LastName='Test');
        con1.IsPrimary__c = true;
        con1.Email = 'test@p1.com';
        con1.AccountId = acct.Id;
        insert con1;
        
        Contact con2 = new Contact(LastName='Test2');
        con2.IsPrimary__c = true;
        con2.Email = 'test@p2.com';
        con2.AccountId = acct.Id;
        insert con2;
        
        Contact con3 = new Contact(LastName='Test3');
        con3.IsPrimary__c = true;
        con3.Email = 'test@p3.com';
        con3.AccountId = acct.Id;
        insert con3;*/
        
        List<Contact> contacts = new List<Contact>();
        for(Integer i=0; i<10; i++){
            Contact con = new Contact(LastName='Test'+i);
            con.IsPrimary__c = true;
            con.AccountId = acct.Id;
            con.Email = 'contact@test'+i+'.com';
            contacts.add(con);
        }
        insert contacts;
        
        List<Contact> afterInsert = [SELECT Id, Email FROM Contact
                                     WHERE IsPrimary__c = true AND AccountId = :acct.Id];
        
        System.assertEquals(1, afterInsert.size());
        System.assertEquals('test@p3.com', afterInsert[0].Email);
    }
    
    // test count on account
    @isTest
    static void testCount(){
        Account acct = new Account(Name='Test');
        insert acct;
        
        List<Contact> cons = new List<Contact>();
        for(Integer i=0; i<3; i++){
            Contact con = new Contact();
            con.LastName = 'Test'+i;
            con.AccountId = acct.Id;
            cons.add(con);
        }
        Insert cons;
        
        Account acctCount = [SELECT Id, Count__c FROM Account
                            WHERE Id =: acct.Id];
        Integer count = (Integer)acctCount.Count__c;
        
        System.debug('acctCount.Count__c'+acctCount.Count__c);
        System.assertEquals(3, count);
    }
}