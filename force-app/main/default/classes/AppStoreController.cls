/**
* @File Name : appStoreController.cls
* @Description : This Apex class is used by App Store Component
* @Author : Sudhanshu
* @Last Modified By : Sudhanshu
* @Last Modified On : February 6, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | February 6, 2025 | Sudhanshu  | Initial Version
**/

public class AppStoreController {

	@AuraEnabled(cacheable = true)
	public static List<App_Store_Item__mdt> getAppStoreItems(String appStoreName){
		Map<String,App_Store_Item__mdt> appStoreItemsMap = App_Store_Item__mdt.getAll();
		List<App_Store_Item__mdt> appStoreItems = new List<App_Store_Item__mdt>();
		for(String appStoreItemDeveloperName :  appStoreItemsMap.keySet()){
			App_Store_Item__mdt appStoreItem = appStoreItemsMap.get(appStoreItemDeveloperName);
			if(appStoreItem.App_Store__r.DeveloperName == appStoreName && appStoreItem.Active__c){
				appStoreItems.add(appStoreItem);
			}
		}
		return appStoreItems;
	}
	
	// @AuraEnabled(cacheable=true)
	// public static Text_Share__c getTextShareByCode(String accessCode){
	// 	List<Text_Share__c> textShareList = [Select Id,Access_Code__c,Text__c from Text_Share__c where Access_Code__c=:accessCode limit 1];
	// 	return textShareList[0];
	// }
}