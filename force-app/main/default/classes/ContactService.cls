public class ContactService {
    public static List<Contact> newContactList(Map<Id, Account> accountIdsWithAccount){
        List<Contact> conList = new List<Contact>();
        for(Id accId : accountIdsWithAccount.keySet()){
            Contact con = new Contact();
            con.AccountId = accId;
            con.LastName = 'Default Contact';
            conList.add(con);
        }
        return conList;
    }
}