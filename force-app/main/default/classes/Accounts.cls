public class Accounts extends fflib_SObjectDomain {
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }
    //fflib_SObjectUnitOfWork 
    
    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }
    
    public override void onApplyDefaults() {
        // Apply defaults to Accoutns
        for(Account account : (List<Account>) Records) {
            account.Description = 'Domain classes rock!';
        }
    }
    
    public override void onBeforeUpdate(Map<Id, sObject> oldRecords) {
        String rock = 'Domain classes rock!';
        List<Account> accList = new List<Account>();
        System.debug('List<Account>) Records>>>'+ ((List<Account>) Records));
        for(Account acc : (List<Account>) Records) {
            acc.AnnualRevenue = rock.getLevenshteinDistance(acc.Description);
            // accList.add(acc);
        }
        // fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] { Account.SObjectType });
        // uow.registerDirty(accList);
        // registerNew List<List<SObject>>
        // List<SObject> 
    }
    public override void onAfterInsert(){
        System.debug('Method starts');

        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] { Contact.SObjectType });
        for(Account acc : (List<Account>) Records) {
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            // conList.add(con);
            uow.registerNew(con);
        }
        
        // uow.registerNew(conList);
        uow.commitWork();
    }
    
    public override void onAfterUpdate(Map<Id, sObject> oldRecords){
        System.debug('Method starts');
        Map<Id, Account> accountIdsWithOldRecords = (Map<Id, Account>) oldRecords;
		List<Contact> conList = new List<Contact>();
        //conList = ContactSelector.selectByAccountId(((List<Account>) Records));
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] { Contact.SObjectType });
        for(Account acc : (List<Account>) Records) {
            for(Contact con : acc.Contacts) {
                con.LastName = acc.Name;
                conList.add(con);
                uow.registerDirty(con);
            }
        }
        System.debug('conList>>'+conList);
        // uow.registerNew(conList);
        uow.commitWork();
        upsert conList;
    }
}