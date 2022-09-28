@isTest
public class AccountControllerTest {
	@isTest
    static void activeAccountTest(){
        List<Account> activeAccts = [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
        Test.startTest();
        List<Account> actualAccts = AccountController.getAllActiveAccounts();
        Test.stopTest();
        System.assertEquals(activeAccts, actualAccts);
    }
}