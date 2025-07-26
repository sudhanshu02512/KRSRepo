public class OpportunityTriggerHandler {
    public static void updateAmountOnOpportunity(List<Opportunity> oppList){
        Set<Id> accIds = new Set<Id>();
        for(Opportunity oppvar : oppList){
            accIds.add(oppvar.AccountId);
        }
        
    }
    
    public static void preventDuplicate(List<Opportunity> oppList){
        Set<String> opptyNames = new Set<String>();
        for(Opportunity oppVar : oppList){
            if(oppVar.Name!=null){
                opptyNames.add(oppVar.Name);
            }
        }
        List<Opportunity> oppNameList = [Select Name from Opportunity where Name IN : opptyNames];
        Map<String,Boolean> mapOfName = new Map<String,Boolean>();
        for(Opportunity oppty:oppNameList){
            mapOfName.put(oppty.Name,true);
        }
        for(Opportunity oppty : oppList){
            if(mapOfName.get(oppty.Name)!=null){
				oppty.addError('Oppty Already Exist');
                Account acc = new Account();
            }
        }
    }
    
    public static void updateAccountDescription(List<Opportunity> oppList){
        List<Account> accToUpdate = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        for(Opportunity oppVar: oppList){
            if(oppVar.AccountId!=null){
                accIds.add(oppVar.AccountId);
            }
        }
		List<Account> accWithMaxOpportunity = [Select Id,(Select Name from Opportunities where amount <> null order by Amount desc limit 1) from Account where Id IN : accIds];

        for(Account accVar : accWithMaxOpportunity){
            List<Opportunity> opplist1 =  accVar.Opportunities;
            Opportunity opp = opplist1[0];
            accVar.Description =opp.Name;
            accToUpdate.add(accVar);
        }
        update accToUpdate;
    }
}