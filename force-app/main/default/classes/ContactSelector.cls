public class ContactSelector extends fflib_SObjectSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Contact.ID,
            Contact.LastName,
            Contact.AccountId };
    }
    
    public Schema.SObjectType getSObjectType() {
        return Contact.sObjectType;
    }
    
    public List<Contact> selectById(Set<ID> idSet){
        return (List<Contact>) selectSObjectsById(idSet);
    }
    
    public List<Contact> selectByContactNames(List<String> lastNames) {
        
        return(List<Contact>) Database.query(newQueryFactory().
                                            selectField(Contact.AccountId.Name).
                                            setCondition('LastName = :lastNames').toSOQL()
                                            );
    }
}