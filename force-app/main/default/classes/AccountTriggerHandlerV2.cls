public with sharing class AccountTriggerHandlerV2 extends BaseTriggerHandler {
    public override void beforeInsert(List<SObject> newList){
        // for(Account accVar :  newList){
        //     System.debug(accVar);
        // }
    }
    public override void beforeUpdate(List<SObject> newList, Map<Id,SObject> oldMap){
        // for(Account accVar :  newList){
        //     System.debug(accVar);
        // }
    }
}