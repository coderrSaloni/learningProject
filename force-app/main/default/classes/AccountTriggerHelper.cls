public class AccountTriggerHelper {
	public static void countAccount(List<Account> newList){
        Integer count;
        List<Account> accts = [SELECT ID, (SELECT Id FROM Contacts) FROM Account
                              WHERE ID IN :newList];
        
    }
}