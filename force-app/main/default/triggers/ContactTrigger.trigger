trigger ContactTrigger on Contact (before insert,before update) {
    //if(Trigger.isBefore  && (Trigger.isInsert || Trigger.isUpdate)){
        //ContactTriggerHandler.validateField(trigger.new);
    //}
    
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        //ContactTriggerHandler.onlyContactOneAccount(Trigger.new);
    }
    
}