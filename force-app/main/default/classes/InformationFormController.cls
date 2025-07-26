/**
* @File Name : InformationFormController.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : February 28, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | February 28, 2025 |   | Initial Version
**/

public class InformationFormController {

	public class InformationWrapper{
		@AuraEnabled public String personalQuesId;
		@AuraEnabled public Personal_Questionnaire__c personalQues;
		@AuraEnabled public String savedMessage;
	}
	@AuraEnabled
	public static InformationWrapper getInformation(String personalQuesId){
		List<Personal_Questionnaire__c> personalQuesList =  [Select Id,Name,Receive_Amount__c,Amount__c,Chk_to_PL__c from Personal_Questionnaire__c  where Id = :personalQuesId];
		if(!personalQuesList.isEmpty()){
			InformationWrapper iw = new InformationWrapper();
			iw.personalQues = personalQuesList[0];
			return iw;
		}
		else{
			return null;
		}
	}
	@AuraEnabled
	public static InformationWrapper saveInformation(String informationWrapper){
		InformationWrapper iw = (InformationWrapper)JSON.deserialize(informationWrapper, InformationWrapper.class);
		update iw.personalQues;
		iw.savedMessage = 'Success';
		return iw;
	}

}