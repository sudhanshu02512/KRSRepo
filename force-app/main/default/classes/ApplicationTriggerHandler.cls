public class ApplicationTriggerHandler {
    public static void deleteStatusReasonOnFlagReset(List<Application__c> newList, Map<Id,Application__c> oldMap){
        Set<Id> appIds = new Set<Id>();
        Map<Id,String> mapOfApplicationStage = new Map<Id,String>();
        
        for(Application__c app:newList){
            if(app.Fraud_Flag__c == 'No' && app.Fraud_Flag__c != oldMap.get(app.Id).Fraud_Flag__c && app.Status__c=='Declined'){
               appIds.add(app.Id);
               mapOfApplicationStage.put(app.Id,app.Stage__c);
            }
        }
        
        if(!appIds.isEmpty()){
            List<Status_Reason__c> statusReasonList = [Select Id,Stage__c,Status__c,Application__c from Status_Reason__c where name ='Unable to verify'  and Application__c In : appIds];
            if(statusReasonList!=null){
                List<Status_Reason__c> statusReasonToDelete = new List<Status_Reason__c>();
                for(Status_Reason__c sr : statusReasonList){
                    if(sr.Stage__c == mapOfApplicationStage.get(sr.Application__c)){
                        statusReasonToDelete.add(sr);
                    }
                }
                if(!statusReasonToDelete.isEmpty()){
                    delete statusReasonToDelete;
                }
            }
           
        }
        
    }
}