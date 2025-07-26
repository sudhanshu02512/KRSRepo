trigger PersonalQuestionnaireTrigger on Personal_Questionnaire__c (before insert, before update) {
    if(Trigger.isBefore && Trigger.isInsert){
        LosPersonalQuestionnaireIncomeSource.populateSourceOfIncomeOnInsert(trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        LosPersonalQuestionnaireIncomeSource.populateSourceOfIncomeOnUpdate(trigger.new, trigger.oldMap);
    }
}