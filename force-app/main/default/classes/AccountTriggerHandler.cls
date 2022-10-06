public class AccountTriggerHandler {
    public static void createContact(Map<Id, Account> accountIdWithAccounts){
        List<Contact> contactList = ContactService.newContactList(accountIdWithAccounts);
        insert contactList;
    }
}