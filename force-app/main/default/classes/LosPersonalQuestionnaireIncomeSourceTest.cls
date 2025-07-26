/**
 * @File Name : LosPersonalQuestionnaireIncomeSourceTest.cls
 * @Description : TECH-86358, This class contains unit tests for validating the behavior of
 * LosPersonalQuestionnaireIncomeSource Apex class
 * @Author : Kanak
 * @Last Modified By :
 * @Last Modified On : March 28, 2025
 * @Modification Log :
 *==============================================================================
 * Ver | Date | Author | Modification
 *==============================================================================
 * 1.0 | March 28, 2025 | Kanak  | Initial Version
 **/

@isTest
private class LosPersonalQuestionnaireIncomeSourceTest {
    
    @testSetup
    static void setupTestData(){
        //Create Questionnaire_Revamp_Setting__c Custom Setting record for current user
        Questionnaire_Revamp_Setting__c qrs = new Questionnaire_Revamp_Setting__c();
        qrs.Enable_Income_Breakdown__c = true;
        qrs.SetupOwnerId=UserInfo.getUserId();
        insert qrs;
    }
    
    
    @isTest
    static void unitTest1IncomeSourceAutomationOnPQInsertion(){
        //Create Application
        Application__c app = new Application__c();
        insert app;
        
        //Create Personal Questionnaire Record
        Personal_Questionnaire__c pq = new Personal_Questionnaire__c();
        pq.Name='Test';
        pq.Application__c=app.Id;
        pq.Annual_Income_from_Employment__c = 100;
        insert pq;
        
        //Get LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
        Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> automationSettings = LOS_PQ_Income_Source_Automation_Setting__mdt.getAll();
        
        //Validation LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
        Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> validAutomationSettings = LosPersonalQuestionnaireIncomeSource.validateAutomationSettings(automationSettings);
        
        //Get Personal Questionnaire Record after creation
        Personal_Questionnaire__c pqRecord = [SELECT Id, Primary_Income_Source__c FROM Personal_Questionnaire__c WHERE Id = :pq.Id];
        
        /**
         * Validate Test Result
         * Expected: Primary_Income_Source__c = 'Annual_Income_from_Employment__c' Ref Code
         */
        
        //Assert Primary_Income_Source__c value on PQ Record
        System.assertEquals(validAutomationSettings.get('Annual_Income_from_Employment__c').Primary_Source_of_Income_Ref_Code__c,
        pqRecord.Primary_Income_Source__c,
        'Primary_Income_Source__c is not populated as expected On PQ Record. Please validate LOS_PQ_Income_Source_Automation_Setting__mdt custom metadata and LosPersonalQuestionnaireIncomeSource class');
    }
    
    @isTest
    static void unitTest2IncomeSourceAutomationOnPQUpdation(){
        //Create Application Record
        Application__c app = new Application__c();
        insert app;
        
        //Create Personal Questionnaire Record
        Personal_Questionnaire__c pq = new Personal_Questionnaire__c();
        pq.Name='Test';
        pq.Application__c=app.Id;
        insert pq;
        
        //Update Income Field on PQ Record on the same record as inserted above
        Personal_Questionnaire__c pqRecordToUpdate = new Personal_Questionnaire__c();
        pqRecordToUpdate.Id = pq.Id;
        pqRecordToUpdate.Annual_Income_from_Employment__c = 10000;
        pqRecordToUpdate.Annual_Income_from_1099__c = 5000;
        update pqRecordToUpdate;
        
        //Get LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
        Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> automationSettings = LOS_PQ_Income_Source_Automation_Setting__mdt.getAll();
        
        //Validation LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
        Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> validAutomationSettings = LosPersonalQuestionnaireIncomeSource.validateAutomationSettings(automationSettings);
        
        //Get Personal Questionnaire Record after creation
        Personal_Questionnaire__c pqRecord = [SELECT Id, Primary_Income_Source__c,Secondary_Income_Source__c FROM Personal_Questionnaire__c WHERE Id = :pqRecordToUpdate.Id];
        
        /**
         * Validate Test Result
         * Expected: Primary_Income_Source__c = 'Annual_Income_from_Employment__c' Ref Code
         *           Secondary_Income_Source__c = 'Annual_Income_from_1099__c' Ref Code
         */
        
        //Assert Primary_Income_Source__c value on PQ Record
        System.assertEquals(validAutomationSettings.get('Annual_Income_from_Employment__c').Primary_Source_of_Income_Ref_Code__c,
        pqRecord.Primary_Income_Source__c,
        'Primary_Income_Source__c is not populated as expected On PQ Record. Please validate LOS_PQ_Income_Source_Automation_Setting__mdt custom metadata records and LosPersonalQuestionnaireIncomeSource class');
        
        //Assert Secondary_Income_Source__c value On PQ Record
        System.assertEquals(validAutomationSettings.get('Annual_Income_from_1099__c').Secondary_Source_of_Income_Ref_Code__c,
        pqRecord.Secondary_Income_Source__c,
        'Secondary_Income_Source__c is not populated as expected On PQ Record. Please validate LOS_PQ_Income_Source_Automation_Setting__mdt custom metadata records and LosPersonalQuestionnaireIncomeSource class'); 
    }

    @isTest
    static void unitTest3IncomeSourceAutomationOnPQUpdation(){
        //Create Application Record
        Application__c app = new Application__c();
        insert app;
        
        //Create Personal Questionnaire Record
        Personal_Questionnaire__c pq = new Personal_Questionnaire__c();
        pq.Name='Test';
        pq.Application__c=app.Id;
        insert pq;
        
        //Update Income Field on PQ Record on the same record as inserted above
        Personal_Questionnaire__c pqRecordToUpdate = new Personal_Questionnaire__c();
        pqRecordToUpdate.Id = pq.Id;
        pqRecordToUpdate.Annual_Income_from_Employment__c = 10000;
        pqRecordToUpdate.Annual_Income_from_1099__c = 5000;
        pqRecordToUpdate.Annual_Income_from_Pension__c = 5000;
        update pqRecordToUpdate;
        
        //Get LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
        Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> automationSettings = LOS_PQ_Income_Source_Automation_Setting__mdt.getAll();
        
        //Validation LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
        Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> validAutomationSettings = LosPersonalQuestionnaireIncomeSource.validateAutomationSettings(automationSettings);
        
        //Get Personal Questionnaire Record after creation
        Personal_Questionnaire__c pqRecord = [SELECT Id, Primary_Income_Source__c,Secondary_Income_Source__c FROM Personal_Questionnaire__c WHERE Id = :pqRecordToUpdate.Id];
        
        /**
         * Validate Test Result
         * Expected: Primary_Income_Source__c = 'Annual_Income_from_Employment__c' Ref Code
         *           Secondary_Income_Source__c = 'Annual_Income_from_1099__c' Ref Code
         */
        
        //Assert Primary_Income_Source__c value on PQ Record
        System.assertEquals(validAutomationSettings.get('Annual_Income_from_Employment__c').Primary_Source_of_Income_Ref_Code__c,
        pqRecord.Primary_Income_Source__c,
        'Primary_Income_Source__c is not populated as expected On PQ Record. Please validate LOS_PQ_Income_Source_Automation_Setting__mdt custom metadata records and LosPersonalQuestionnaireIncomeSource class');
        
        //Assert Secondary_Income_Source__c value On PQ Record
        System.assertEquals(validAutomationSettings.get('Annual_Income_from_1099__c').Secondary_Source_of_Income_Ref_Code__c,
        pqRecord.Secondary_Income_Source__c,
        'Secondary_Income_Source__c is not populated as expected On PQ Record. Please validate LOS_PQ_Income_Source_Automation_Setting__mdt custom metadata records and LosPersonalQuestionnaireIncomeSource class'); 
    }
}