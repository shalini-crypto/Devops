trigger AccountTrigger on Account (before insert, before update, after insert) {
    if(trigger.isInsert){
        AccountTriggerHandler handler = new AccountTriggerHandler();
        if (trigger.isBefore) {
            handler.beforeInsert(trigger.new);
        }
        if (trigger.isAfter) {
            handler.afterInsert(trigger.new);
        }
    // }else if(trigger.isUpdate) {
    
    // }
    }
}