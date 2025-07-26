public class ParentTriggerHandler {
    public static void beforeUpdate(List<Parent_Object__c> newList, Map<Id,Parent_Object__c> oldMap){
        for(Parent_Object__c op: newList){
            op.My_Text__c='14';
        }
    }
    public static void afterUpdate(List<Parent_Object__c> newList, Map<Id,Parent_Object__c> oldMap){
       for(Parent_Object__c op: newList){
            System.debug(op.My_Text__c);
        }
    }
}