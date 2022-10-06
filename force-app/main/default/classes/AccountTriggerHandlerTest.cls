@isTest
public class AccountTriggerHandlerTest {
 	@testSetup
    public static void testSetup(){
        Account acc = new Account();
        acc.Name = 'test Account';
        insert Acc;
    }
    @isTest
    static void testContactCreate(){
        List<Contact> conList = [SELECT Id FROM Contact];
        Test.startTest();
        System.assertEquals(1, conList.size());
        Test.stopTest();
    }
}