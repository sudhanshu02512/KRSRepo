/**
* @File Name : RecordPageParentController.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : January 3, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | January 3, 2025 |   | Initial Version
**/

public class RecordPageParentController {
	@AuraEnabled
	public static Application__c getApplicationRecord(Id recordId){
		if(recordId != null){
			Application__c app = [Select Id,Name,Reason__c from Application__c where Id = :recordId ];
			return app;
		}
		else{
			return null;
		}
	}
	@AuraEnabled
	public static Boolean saveApplicationRecord(Application__c app){
		if(app != null){
			update app;
			return true;
		}
		else{
			return false;
		}
	}
}