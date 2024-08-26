trigger OppotunityTrigger on Opportunity (before insert) {
    OpportunityTriggerHandler handler = new OpportunityTriggerHandler();
    // insert
    if(Trigger.isInsert){
        handler.populateDescription;
    }
}