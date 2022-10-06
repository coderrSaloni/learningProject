trigger AccountTrigger on Account (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            AccountTriggerHandler.createContact(Trigger.newMap);
        }
    }
}