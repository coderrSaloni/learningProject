public class OpportunitiesTriggerHandler extends fflib_SObjectDomain{
    public OpportunitiesTriggerHandler(List<Opportunity> sObjectList) {
        // Domain classes are initialised with lists to enforce bulkification throughout
        super(sObjectList);
    }
}