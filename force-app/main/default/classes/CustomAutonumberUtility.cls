public class CustomAutonumberUtility {

    public static Custom_Autonumber__c getCustomAutonumber(String key){
        try{
            if(key != null){
                Custom_Autonumber__c cAnVar = [Select Id,Key__c,Number__c 
                from Custom_Autonumber__c 
                where Key__c=:key limit 1 FOR UPDATE];

                if(cAnVar == null){
                    cAnVar = new Custom_Autonumber__c();
                    cAnVar.Key__c = key;
                    cAnVar.Number__c = 0;
                }
                else{
                    cAnVar.Number__c = cAnVar.Number__c + 1;
                }

                upsert cAnVar;
                return cAnVar;
            }
            else{
                System.debug('Enter valid key');
                return null;
            }
        }
        catch(Exception e){
            return null;
        }
    }
}