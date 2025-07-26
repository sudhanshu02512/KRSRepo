public class AccountTriggerPreventDelete {
    public static void preventDeleteOnRelatedContact(List<Account> accList,Map<Id,Account> oldMap){
        Set<Id> accountIds = oldMap.keySet();
        Map<Id,Integer> mapOfContactCount = new Map<Id,Integer>();
        List<Account> relatedAccWithCon = [Select Id,(Select id from Contacts) from Account where Id IN :accountIds];
        for(Account acc:relatedAccWithCon){
            if(acc.Contacts!=null){
                mapOfContactCount.put(acc.Id,acc.Contacts.size());
            }
            else{
                mapOfContactCount.put(acc.Id,0);
            }
        }
        
        for(Account accvar:accList){
            if(mapOfContactCount.get(accvar.Id)!=null && mapOfContactCount.get(accvar.Id)>0){
                accvar.addError('Contact Exist');
            }
        }
    }
}