trigger PersonalFinancialItemTrigger on Personal_Financial_Item__c (before insert,after insert,before update,after update) {
    if(Trigger.isBefore && Trigger.isInsert){
        PersonalFinancialItemTriggerHandler.doBeforeInsertAction(Trigger.new);
        //optimized
        // for(Personal_Financial_Item__c pfi : trigger.new){
        //     System.debug(pfi);
        // }
        
        // Map<Id,Schema.RecordTypeInfo> rtMapById = Schema.SObjectType.Personal_Financial_Item__c.getRecordTypeInfosById();
        // for(Personal_Financial_Item__c pfiRecord: trigger.new){
        //     if(rtMapById.get(pfiRecord.RecordTypeId).getDeveloperName() == 'Default' && pfiRecord.Personal_Financial_Summary__c != null && pfiRecord.Account_Number__c != null && pfiRecord.Balance__c != null &&  pfiRecord.Monthly_Payment__c !=null ){
        //         List<Personal_Financial_Summary__c> pfsList = [Select Id,Application__c from Personal_Financial_Summary__c where Id =:pfiRecord.Personal_Financial_Summary__c];
        //         if(pfsList !=null){
        //             Personal_Financial_Summary__c pfs = pfsList[0];
        //             if(pfs.Application__c!=null){
        //                 // Check for co gurantors 
        //                 List<OpportunityContactRole> ocrList = [Select Id,ContactId,Role from OpportunityContactRole where Application__c = :pfs.Application__c and ContactId = :pfiRecord.Guarantor__c and Role='Co-Guarantor'];
        //                 System.debug('ocrlist'+ocrList);
        //                 if(ocrList != null && ocrList.size()>0){
        //                     OpportunityContactRole ocr = ocrList[0];
        //                     if(ocr.Role == 'Co-Guarantor'){
        //                        List<Personal_Financial_Item__c> pfiRecordList = [Select Id,Account_Number__c,Balance__c,Monthly_Payment__c from Personal_Financial_Item__c where Personal_Financial_Summary__r.Application__c =:pfs.Application__c and Guarantor__c!=:pfiRecord.Guarantor__c];
        //                         for(Personal_Financial_Item__c pfiVar : pfiRecordList){
        //                             if(pfiVar.Account_Number__c == pfiRecord.Account_Number__c 
        //                               && pfiVar.Balance__c == pfiRecord.Balance__c
        //                               && pfiVar.Monthly_Payment__c == pfiRecord.Monthly_Payment__c){
        //                                 pfiRecord.Status__c='Do not include';
        //                             }
        //                         }
        //                     }
        //                 }
                        
                       
        //             }
        //         }                
        //     }
        // }
    }
    if(Trigger.isAfter && Trigger.isInsert){
        //PersonalFinancialItemTriggerHandler.doAfterInsertAction(Trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        PersonalFinancialItemTriggerHandler.doBeforeUpdateAction();
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        PersonalFinancialItemTriggerHandler.doAfterUpdateAction();
    }
}