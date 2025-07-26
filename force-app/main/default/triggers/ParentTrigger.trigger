trigger ParentTrigger on Parent_Object__c (before update,after update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        ParentTriggerHandler.beforeUpdate(trigger.new, trigger.oldmap);
    }
    
     if(Trigger.isAfter && Trigger.isUpdate){
       ParentTriggerHandler.afterUpdate(trigger.new, trigger.oldmap);
    }
    
}