public class ApexController {

    @AuraEnabled(cacheable = true)
    public static List<Personal_Questionnaire__c> getSamplePQData(){
        return [SELECT Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, 
                LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, 
                LastReferencedDate, Amount__c, Receive_Amount__c, Amount_2__c, 
                Total_Amount__c, Primary_Income_Source__c, Alimony_Amount__c, 
                Number__c, Secondary_Income_Source__c, Annual_Income_from_Employment__c, 
                Annual_Income_from_1099__c, Annual_Income_from_Pension__c, Other_Income__c, 
                Application__c,Application__r.Name, Chk_to_PL__c FROM Personal_Questionnaire__c ];
    }

    @AuraEnabled(cacheable = true)
    public static List<Personal_Questionnaire__c> getSamplePQData2(){
        return [SELECT Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, 
                LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, 
                LastReferencedDate, Amount__c, Receive_Amount__c, Amount_2__c, 
                Annual_Income_from_1099__c, Annual_Income_from_Pension__c, Other_Income__c, 
                Application__c,Application__r.Name, Chk_to_PL__c FROM Personal_Questionnaire__c ];
    }

    @AuraEnabled(cacheable = true)
    public static List<Opportunity> getSampleOpportunityData(){
        return [Select Id,StageName, AccountId,Account.Name,CreatedDate,LastModifiedDate from Opportunity  ];
    }
    @AuraEnabled(cacheable = true)
    public static List<Account> getSampleAccountData(){
        return [Select Id,Name,Phone,AccountNumber,CreatedDate,LastModifiedDate from Account];
    }

    @AuraEnabled(cacheable = true)
    public static List<Contact> getSampleContactData(){
        return [Select Id,Name,Email,AccountId,Account.Name from Contact ];
    }
    
}