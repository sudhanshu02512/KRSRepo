trigger OpportunityTrigger on Opportunity (before insert,after insert) {
    //if(Trigger.isAfter && Trigger.isInsert){
        //OpportunityTriggerHandler.updateAmountOnOpportunity(Trigger.new);
    //}
    if(Trigger.isBefore && Trigger.isInsert){
        //OpportunityTriggerHandler.preventDuplicate(trigger.new);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        OpportunityTriggerHandler.updateAccountDescription(trigger.new);        
    }
}