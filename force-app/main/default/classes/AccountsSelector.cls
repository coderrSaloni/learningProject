public class AccountsSelector extends fflib_SObjectSelector
{
    
    public List<Schema.SObjectField> getSObjectFieldList()
    {
        return new List<Schema.SObjectField> {
            Account.Id,
                Account.Name,
                Account.Description
                };
                    }
    
    public Schema.SObjectType getSObjectType()
    {
        return Account.SObjectType;
    }
    
    public List<Account> selectById(Set<Id> idSet)
    {
        return (List<Account>) selectSObjectsById(idSet);
    }
    
    public List<Account> selectByOpportunity(List<Opportunity> opportunities)
    {
        // Related Accounts
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : (List<Opportunity>) opportunities)
        {
            if (opp.AccountId != null)
            {
                accountIds.add(opp.AccountId);
            }
        }
        return selectById(accountIds);
    }	
}