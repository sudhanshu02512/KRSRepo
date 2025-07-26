/**
 * @File Name : LosPersonalQuestionnaireIncomeSource.cls
 * @Description : TECH-86358
 * @Author : Kanak
 * @Last Modified By :
 * @Last Modified On : March 28, 2025
 * @Modification Log :
 *==============================================================================
 * Ver | Date | Author | Modification
 *==============================================================================
 * 1.0 | March 20, 2025 | Kanak  | Initial Version
 **/

public inherited sharing class LosPersonalQuestionnaireIncomeSource {
    
    //Method that will be called on When PQ records are inserted
    public static void populateSourceOfIncomeOnInsert(List<Personal_Questionnaire__c> newPqRecordList){
        System.debug('Personal Questionnaire Income Source Automation On Insertion is initiated');
        if(!newPqRecordList.isEmpty()){
            //Get Questionnaire_Revamp_Setting__c Custom Setting
            Questionnaire_Revamp_Setting__c qrs = Questionnaire_Revamp_Setting__c.getInstance(UserInfo.getUserId());
            
            //Check Enable_Income_Breakdown__c checkbox on Questionnaire Revamp Setting
            if(qrs.Enable_Income_Breakdown__c){
                
                //Check Income_Breakdown_Release_Date custom label
                if(System.Label.Income_Breakdown_Release_Date != null && validateFeatureReleaseDate(System.Label.Income_Breakdown_Release_Date)){
                    //Convert Release Data from String to Date
                    Date featureReleaseDate = Date.valueOf(System.Label.Income_Breakdown_Release_Date);
                    
                    //Get LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
                    Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> automationSettings = LOS_PQ_Income_Source_Automation_Setting__mdt.getAll();
                    
                    //Validation LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
                    Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> validAutomationSettings = validateAutomationSettings(automationSettings);
                    
                    if(!validAutomationSettings.isEmpty()){
                        //Set to store application Ids
                        Set<Id> appIds = new Set<Id>();
                        //Store Application Id into Set From PQ List
                        for(Personal_Questionnaire__c pqVar: newPqRecordList){
                            if(pqVar.Application__c	!= null){
                                appIds.add(pqVar.Application__c);
                            }
                        }
                        //Check Application Id Set
                        if(!appIds.isEmpty()){
                            //Get Applications Created Date
                            List<Application__c> appList = [Select Id,CreatedDate from Application__c  where Id In: appIds];
                            
                            if(!appList.isEmpty()){
                                Map<Id,Date> mapOfAppllicationWithCreatedDate = new Map<Id,Date>();
                                for(Application__c appVar : appList){
                                    mapOfAppllicationWithCreatedDate.put(appVar.Id,appVar.CreatedDate.date());
                                }
                                //List to store PQ record that are eligible for the automation
                                List<Personal_Questionnaire__c> pqListEligibleForAutomation = new List<Personal_Questionnaire__c>();
                                
                                /**
                                 * Insert Sceanrio: If application created date greater than featureReleaseDate, then
                                 * are eligible for the automation
                                 */
                                for(Personal_Questionnaire__c pqVar: newPqRecordList){
                                    if(mapOfAppllicationWithCreatedDate.get(pqVar.Application__c) > featureReleaseDate){
                                        pqListEligibleForAutomation.add(pqVar);
                                    }
                                }
                                
                                if(!pqListEligibleForAutomation.isEmpty()){
                                    System.debug('Eligible PQ records are found for Income Source automation');
                                    for(Personal_Questionnaire__c pqVar : pqListEligibleForAutomation){
                                        List<IncomeField> incomeFieldList = new List<IncomeField>();
                                        for(String incomeFieldApi : validAutomationSettings.keySet()){
                                            Decimal amount = (Decimal)pqVar.get(incomeFieldApi);
                                            if(amount > 0){
                                                IncomeField incomeField = new IncomeField();
                                                incomeField.fieldApi=incomeFieldApi;
                                                incomeField.value=amount;
                                                incomeField.hierarchy = (Integer)validAutomationSettings.get(incomeFieldApi).Hierarchy__c;
                                                incomeFieldList.add(incomeField);
                                                System.debug(incomeField);
                                            }
                                        }
                                        System.debug('List of Income fields before sorting');
                                        System.debug(incomeFieldList);
                                        
                                        // Start Sorting the list of income fields
                                        CompareIncomeFields incomeFieldComparator = new CompareIncomeFields();
                                        incomeFieldList.sort(incomeFieldComparator);
                                        
                                        System.debug('List of Income fields after sorting');
                                        System.debug(incomeFieldList);
                                        
                                        //Populate Primary and Secondary Source of Income
                                        populateSourceOfIncomeHelper(pqVar,incomeFieldList,validAutomationSettings);
                                    }
                                }
                                else{
                                    System.debug('No eligible PQ records are found for Income Source automation');
                                }
                                
                            }
                            else{
                                System.debug('No Application records are found for PQ records');
                            }
                        }
                        else {
                            System.debug('No eligible PQ records are found for Income Source automation as Application Ids are empty');
                        }
                    }
                    else{
                        System.debug('No Valid LOS_PQ_Income_Source_Automation_Setting__mdt Custom Metadata records are found for the automation');
                    }
                }
                else{
                    System.debug('Personal Questionnaire Income Source Automation is stopped as Date in Income_Breakdown_Release_Date custom label is invalid');
                }
            }
            else{
                System.debug('Personal Questionnaire Income Source Automation is stopped as Questionnaire_Revamp_Setting__c.Enable_Income_Breakdown__c setting is disabled for the current user');
            }
        }
        else {
            System.debug('Personal Questionnaire Income Source Automation cannot be initiated as no PQ records are found');
        }
    }
    
    //Method that will be called on When PQ records are updated
    public static void populateSourceOfIncomeOnUpdate(List<Personal_Questionnaire__c> updatedPQRecordList, Map<Id, Personal_Questionnaire__c> oldMap){
        System.debug('Personal Questionnaire Income Source Automation On Updation is initiated');
        if(!updatedPQRecordList.isEmpty() && !oldMap.isEmpty()){
            //Get Questionnaire_Revamp_Setting__c Custom Setting
            Questionnaire_Revamp_Setting__c qrs = Questionnaire_Revamp_Setting__c.getInstance(UserInfo.getUserId());
            
            //Check Enable_Income_Breakdown__c checkbox on Questionnaire Revamp Setting
            if(qrs.Enable_Income_Breakdown__c){
                
                //Check Income_Breakdown_Release_Date custom label
                if(System.Label.Income_Breakdown_Release_Date != null && validateFeatureReleaseDate(System.Label.Income_Breakdown_Release_Date)){
                    //Convert Release Data from String to Date
                    Date featureReleaseDate = Date.valueOf(System.Label.Income_Breakdown_Release_Date);
                    
                    //Get LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
                    Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> automationSettings = LOS_PQ_Income_Source_Automation_Setting__mdt.getAll();
                    
                    //Validate LOS_PQ_Income_Source_Automation_Setting__mdt Metadata Records
                    Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> validAutomationSettings = validateAutomationSettings(automationSettings);
                    if(!validAutomationSettings.isEmpty()){
                        //Set to store application Ids
                        Set<Id> appIds = new Set<Id>();
                        //Store Application Id into Set From PQ List
                        for(Personal_Questionnaire__c pqVar: updatedPQRecordList){
                            if(pqVar.Application__c	!= null){
                                appIds.add(pqVar.Application__c);
                            }
                        }
                        //Check Application Id Set
                        if(!appIds.isEmpty()){
                            //Get Applications Created Date
                            List<Application__c> appList = [Select Id,CreatedDate from Application__c  where Id In: appIds];
                            if(!appList.isEmpty()){
                                Map<Id,Date> mapOfAppllicationWithCreatedDate = new Map<Id,Date>();
                                for(Application__c appVar : appList){
                                    mapOfAppllicationWithCreatedDate.put(appVar.Id,appVar.CreatedDate.date());
                                }
                                //List to store PQ record that are eligible for the automation
                                List<Personal_Questionnaire__c> pqListEligibleForAutomation = new List<Personal_Questionnaire__c>();
                                
                                /**
                                 * Update Sceanrio : 
                                 * If application created date greater than featureReleaseDate, then
                                 * PQ Records in which any income amount field is updated or application field is updated are eligible for the automation
                                 */
                                for(Personal_Questionnaire__c pqVar: updatedPQRecordList){
                                    if(mapOfAppllicationWithCreatedDate.get(pqVar.Application__c) > featureReleaseDate){
                                        //Check application field is update
                                        if(pqVar.Application__c != oldMap.get(pqVar.Id).Application__c){
                                            pqListEligibleForAutomation.add(pqVar);
                                        }
                                        else{
                                            //Check any income field is update
                                            for(String incomeFieldApi : validAutomationSettings.keySet()){
                                                if(pqVar.get(incomeFieldApi) != oldMap.get(pqVar.Id).get(incomeFieldApi)){
                                                    pqListEligibleForAutomation.add(pqVar);
                                                    break;
                                                }
                                            }
                                        }
                                        
                                    }
                                }
                                
                                if(!pqListEligibleForAutomation.isEmpty()){
                                    System.debug('Eligible PQ records are found for Income Source automation');
                                    
                                    //Map to store PQ Id with list of Income fields
                                    Map<Id,List<IncomeField>> mapOfPqIdWithIncomeFieldList = new Map<Id,List<IncomeField>>();
                                    
                                    //Add PQ Ids of Eligible for the automation with list of Income fields in map
                                    for(Personal_Questionnaire__c pqVar : pqListEligibleForAutomation){
                                        List<IncomeField> incomeFieldList = new List<IncomeField>();
                                        System.debug('PQ recordId: '+pqVar.Id);
                                        for(String incomeFieldApi : validAutomationSettings.keySet()){
                                            Decimal amount = (Decimal)pqVar.get(incomeFieldApi);
                                            if(amount > 0){
                                                IncomeField incomeField = new IncomeField();
                                                incomeField.fieldApi=incomeFieldApi;
                                                incomeField.value=amount;
                                                incomeField.hierarchy = (Integer)validAutomationSettings.get(incomeFieldApi).Hierarchy__c;
                                                incomeFieldList.add(incomeField);
                                                System.debug(incomeField);
                                            }
                                        }
                                        
                                        mapOfPqIdWithIncomeFieldList.put(pqVar.Id,incomeFieldList);
                                    }
                                    
                                    System.debug('Map of PQ Id with list of Income fields before sorting');
                                    System.debug(mapOfPqIdWithIncomeFieldList);
                                    
                                    //Map that store PQ Ids with sorted income field list
                                    Map<Id,List<IncomeField>> mapOfPqIdWithSortedIncomeFieldList = new Map<Id,List<IncomeField>>();
                                    
                                    // Start Sorting the list of income fields
                                    CompareIncomeFields incomeFieldComparator = new CompareIncomeFields();
                                    for(Id pqId : mapOfPqIdWithIncomeFieldList.keySet()){
                                        List<IncomeField> incomeFieldList = mapOfPqIdWithIncomeFieldList.get(pqId);
                                        incomeFieldList.sort(incomeFieldComparator);
                                        mapOfPqIdWithSortedIncomeFieldList.put(pqId,incomeFieldList);
                                    }
                                    
                                    System.debug('Map of PQ Id with list of Income fields after sorting');
                                    System.debug(mapOfPqIdWithSortedIncomeFieldList);
                                    
                                    //Populate Primary and Secondary Source of Income
                                    for(Personal_Questionnaire__c pqVar : pqListEligibleForAutomation){
                                        List<IncomeField> sortedIncomeFieldList = mapOfPqIdWithSortedIncomeFieldList.get(pqVar.Id);
                                        populateSourceOfIncomeHelper(pqVar,sortedIncomeFieldList,validAutomationSettings);
                                    }
                                }
                                else{
                                    System.debug('No eligible PQ records are found for Income Source automation');
                                }
                                
                            }
                            else{
                                System.debug('No Application records are found for PQ records');
                            }
                        }
                        else {
                            System.debug('No eligible PQ records are found for Income Source automation as Application Ids are empty');
                        }
                    }
                    else{
                        System.debug('No Valid LOS_PQ_Income_Source_Automation_Setting__mdt Custom Metadata records are found for the automation');
                    }
                }
                else{
                    System.debug('Personal Questionnaire Income Source Automation is stopped as Date in Income_Breakdown_Release_Date custom label is invalid');
                }
            }
            else{
                System.debug('Personal Questionnaire Income Source Automation is stopped as Questionnaire_Revamp_Setting__c.Enable_Income_Breakdown__c setting is disabled for the current user');
            }
        }
        else {
            System.debug('Personal Questionnaire Income Source Automation cannot be initiated as no PQ records are found');
        }
    }
    
    
    //This method validate LOS_PQ_Income_Source_Automation_Setting__mdt custom metadata records
    public static Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> validateAutomationSettings(Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> automationSettings){
        //Map that store valid automation setting
        Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> validAutomationSettings = new Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt>();
        if(!automationSettings.isEmpty()){
            
            //Get Personal_Questionnaire__c fields
            Map<String, Schema.SObjectField> pqFieldMap = Schema.getGlobalDescribe().get('Personal_Questionnaire__c').getDescribe().fields.getMap();
            Set<String> setOfPqFieldsApiNames = pqFieldMap.keySet();
            
            // Get Primary_Source_of_Income__c picklist values
            List<Schema.PicklistEntry> primayIncomePicklistEntries = pqFieldMap.get('Primary_Income_Source__c').getDescribe().getPicklistValues();
            Set<String> setOfPrimaryIncomePickValApiName = new Set<String>();
            for(Schema.PicklistEntry pipe : primayIncomePicklistEntries){
                setOfPrimaryIncomePickValApiName.add(pipe.getValue());
            }
            
            //Get Secondary_Source_of_Income__c picklist values
            List<Schema.PicklistEntry> secondaryIncomePicklistEntries = pqFieldMap.get('Secondary_Income_Source__c').getDescribe().getPicklistValues();
            Set<String> setOfsecondaryIncomePickValApiName = new Set<String>();
            for(Schema.PicklistEntry sipe : secondaryIncomePicklistEntries){
                setOfsecondaryIncomePickValApiName.add(sipe.getValue());
            }
            
            //Validate Custom Metadata Records
            for(String devName : automationSettings.keySet()){
                if(automationSettings.get(devName).Field_API_Name__c != null
                    && automationSettings.get(devName).Hierarchy__c	!= null
                    && automationSettings.get(devName).Primary_Source_of_Income_Ref_Code__c	!= null
                    && automationSettings.get(devName).Secondary_Source_of_Income_Ref_Code__c != null
                    && setOfPqFieldsApiNames.contains((automationSettings.get(devName).Field_API_Name__c).toLowerCase())
                    && setOfPrimaryIncomePickValApiName.contains(automationSettings.get(devName).Primary_Source_of_Income_Ref_Code__c)
                && setOfsecondaryIncomePickValApiName.contains(automationSettings.get(devName).Secondary_Source_of_Income_Ref_Code__c)){
                    validAutomationSettings.put(automationSettings.get(devName).Field_API_Name__c,automationSettings.get(devName));
                }
                else{
                    System.debug('Rejected LOS_PQ_Income_Source_Automation_Setting__mdt Custom Metadata record with Field API Name as '+automationSettings.get(devName).Field_API_Name__c);
                }
            }
        }
        else{
            System.debug('No LOS_PQ_Income_Source_Automation_Setting__mdt Custom Metadata records found for the automation');
        }
        return validAutomationSettings;
    }
    
    //This method validate Feature Release date
    public static Boolean validateFeatureReleaseDate(String featureReleaseData){
        String regex = '[0-9]{4}-[0-9]{0,2}-[0-9]{0,2}';
        Pattern datePattern = Pattern.compile(regex);
        Matcher matchDate = datePattern.matcher(featureReleaseData);
        return matchDate.matches();
    }
    
    //This method populate Income Source on PQ Record
    public static void populateSourceOfIncomeHelper(Personal_Questionnaire__c pqVar, List<IncomeField> sortedIncomeFieldList,Map<String, LOS_PQ_Income_Source_Automation_Setting__mdt> validAutomationSettings){
        if(pqVar != null){
            if(sortedIncomeFieldList.isEmpty()){
                pqVar.Primary_Income_Source__c	 = '';
                pqVar.Secondary_Income_Source__c = '5';
            }
            else if(sortedIncomeFieldList.size() == 1) {
                pqVar.Primary_Income_Source__c	 = validAutomationSettings.get(sortedIncomeFieldList[0].fieldApi).Primary_Source_of_Income_Ref_Code__c;
                pqVar.Secondary_Income_Source__c = '5';
            }
            else if(sortedIncomeFieldList.size() == 2){
                pqVar.Primary_Income_Source__c	 = validAutomationSettings.get(sortedIncomeFieldList[0].fieldApi).Primary_Source_of_Income_Ref_Code__c;
                pqVar.Secondary_Income_Source__c = validAutomationSettings.get(sortedIncomeFieldList[1].fieldApi).Secondary_Source_of_Income_Ref_Code__c;
            }
            else if (sortedIncomeFieldList.size() > 2){
                pqVar.Primary_Income_Source__c	 = validAutomationSettings.get(sortedIncomeFieldList[0].fieldApi).Primary_Source_of_Income_Ref_Code__c;
                if(validAutomationSettings.get(sortedIncomeFieldList[1].fieldApi).Secondary_Source_of_Income_Ref_Code__c == '5'){
                    // Check Until we found value other than no secondary income
                    Integer indexOfSecondaryValue;
                    for(indexOfSecondaryValue = 2; indexOfSecondaryValue < sortedIncomeFieldList.size() -1 ; indexOfSecondaryValue++){
                        if(validAutomationSettings.get(sortedIncomeFieldList[indexOfSecondaryValue].fieldApi).Secondary_Source_of_Income_Ref_Code__c != '5'){
                            break;
                        }
                    }
                    if(indexOfSecondaryValue>sortedIncomeFieldList.size()){
                        pqVar.Secondary_Income_Source__c ='5';
                    }
                    else{
                        pqVar.Secondary_Income_Source__c = validAutomationSettings.get(sortedIncomeFieldList[indexOfSecondaryValue].fieldApi).Secondary_Source_of_Income_Ref_Code__c;
                    }
                }
                else{
                    pqVar.Secondary_Income_Source__c = validAutomationSettings.get(sortedIncomeFieldList[1].fieldApi).Secondary_Source_of_Income_Ref_Code__c;
                }
            }
            System.debug('Populated Primary Income Source: \''+pqVar.Primary_Income_Source__c+'\' and Secondary Income Source: \''+pqVar.Secondary_Income_Source__c+'\'');
        }
        else {
            System.debug('Cannot Populate Income source as PQ records is invalid');
        }
    }
    
    //This Class used store to Income Fields data
    public class IncomeField{
        String fieldApi;
        Decimal value;
        Integer hierarchy;
    }
    
    //This Comparator is used to Sort the Income Fields
    public class CompareIncomeFields implements Comparator<IncomeField>{
        public Integer compare(IncomeField field1, IncomeField field2){
            if(field1 == null || field2 == null){
                return 1;
            }
            else if(field1.value > field2.value){
                return -1;
            }
            else if(field1.value == field2.value){
                return field1.hierarchy > field2.hierarchy ? 1 : -1;
            }
            else{
                return 1;
            }
        }
    }
    
}