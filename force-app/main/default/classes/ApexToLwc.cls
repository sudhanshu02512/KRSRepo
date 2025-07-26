public class ApexToLwc {
    @AuraEnabled(cacheable =true)
    public static List<Contact> toLwc(String accId,List<Account> accList){
        System.debug(accList);
        return [Select Id from Contact where AccountId=:accId];
    }
}