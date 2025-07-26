public class CaseTriggerHandler {
    public static void populateContactOnCase(List<Case> caseList){
        Set<String> emails = new Set<String>();
        for(Case caseVar : caseList){
            if(caseVar.SuppliedEmail!=null){
                emails.add(caseVar.SuppliedEmail);
            }
        }
        List<Contact> conList = [Select Id,Email from Contact where Email IN : emails];
        Map<String,Id> mapContactEmail = new Map<String,Id>();
        for(Contact conVar:conList){
            mapContactEmail.put(conVar.Email,conVar.Id);
        }
        List<Case> caseToUpdate = new List<Case>();
        Map<String,Contact> mapOfConToCreate = new Map<String,Contact>();
        for(Case caseVar : caseList){
            if(mapContactEmail.get(caseVar.SuppliedEmail)!=null){
                Case caseVar1 = new Case();
                caseVar1.Id = caseVar.Id;
                caseVar1.ContactId=mapContactEmail.get(caseVar.SuppliedEmail);
                caseToUpdate.add(caseVar1);
            }
            else{
                if(mapOfConToCreate.get(caseVar.SuppliedEmail)==null){
                    Contact conVar = new Contact();
                	conVar.LastName= 'Test';
                	conVar.Email=caseVar.SuppliedEmail;
                    mapOfConToCreate.put(caseVar.SuppliedEmail,conVar);
                }
            }
        }
        if(mapOfConToCreate!=null){
            List<Contact> conToInsert = new List<Contact>();
            for(String email: mapOfConToCreate.keySet()){
                conToInsert.add(mapOfConToCreate.get(email));
            }
            insert conToInsert;
        }
        for(Case caseVar: caseList){
            if(mapOfConToCreate.get(caseVar.SuppliedEmail)!=null){
                Case caseVar1 = new Case();
                caseVar1.Id = caseVar.Id;
                caseVar1.ContactId=mapOfConToCreate.get(caseVar.SuppliedEmail).Id;
                caseToUpdate.add(caseVar1);
            }
        }
        if(caseToUpdate!=null){
            update caseToUpdate;
        }
    }
    
    public static void afterUpdate(List<Case> caseList,Map<Id,Case> oldMap){
        List<Case> caseListToUpdate = new List<Case>();
        List<User> userList= [Select Id from User];
        for(Case caseVar : caseList){
            Case caseToUpdate = new Case();
           	caseToUpdate.Id = caseVar.Id;
			caseListToUpdate.add(caseToUpdate);            
        }
        if(!caseListToUpdate.isEmpty()){
            update caseListToUpdate;
        }
    }
}