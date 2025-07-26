public class MyApexController {
	
    @AuraEnabled
    public static String getType(){
        return 'Commercial';
    }
    
    @AuraEnabled
    public static Object getApplicationType(){
        List<Account> acc = [SELECT Id,Name,Type FROM Account where Type<> null order by CreatedDate desc limit 1];
        return acc.isEmpty() ? null : acc[0]; 
    }
}