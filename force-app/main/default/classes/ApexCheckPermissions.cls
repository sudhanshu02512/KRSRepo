public without Sharing class ApexCheckPermissions {
    public static void checkPermissions(){
        List<DescribesObjectResult> sobjDescList = Schema.describeSobjects(new List<String>{'Account'});
        DescribesObjectResult accountDesc = sobjDescList[0];
        System.debug(accountDesc.isCreateable());
        System.debug(accountDesc.isCustom());
        System.debug(accountDesc.isCustomSetting());
        System.debug(accountDesc.isDeletable());
        //Schema.SObjectTypeFields fields = accountDesc.fields();
        DescribesObjectResult acc = Schema.SobjectType.Account;
        System.debug(acc.isCreateable());
        System.debug(acc.isCustom());
        System.debug(acc.isCustomSetting());
        System.debug(acc.isDeletable());
        
    }
}