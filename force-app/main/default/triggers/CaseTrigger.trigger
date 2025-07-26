trigger CaseTrigger on Case (after update) {
    if(trigger.isAfter && Trigger.isInsert){
        //CaseTriggerHandler.populateContactOnCase(trigger.new);
    }
    if(trigger.isAfter && Trigger.isUpdate){
        CaseTriggerHandler.afterUpdate(trigger.new,trigger.oldMap);
    }
    
}