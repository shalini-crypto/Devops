trigger AccountTrigger on Account (before insert, before update, after insert) {
    if(trigger.isInsert){
        AccountTriggerHandler handler = new AccountTriggerHandler();
        if (trigger.isBefore) {
            handler.updateRating(trigger.new);
        }
        if (trigger.isAfter) {
            handler.createRelatedOpportunity(trigger.new);
        }
    }
    if(trigger.isUpdate){
        if (trigger.isBefore) {
        }
    // }else if(trigger.isUpdate) {
    
    // }
    }
    
}