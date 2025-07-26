public class ContactTriggerHandler {
    public static void validateField(List<Contact> newConList){
        
            if(newConList!=null){
                for(Contact conVar: newConlist){
                    if(conVar.Phone==null){
                       conVar.addError('Phone','Phone is Mandatory');
                    }
                    if(conVar.Email == null){
                        conVar.addError('Email','Email is Mandatory');
                    }
                }
            }
        
    }
    
    public static void onlyContactOneAccount(List<Contact> conList){
        Set<Id> accIds = new Set<Id>();
        for(Contact conVar:conList){
            if(conVar.AccountId!=null){
                accIds.add(conVar.AccountId);
            }
        }
        List<AggregateResult> countOfContact = [Select AccountId,count(Id) from Contact where AccountId IN:accIds group by AccountId];
        Map<Id,Integer> mapOfContactCount = new Map<Id,Integer>();
        for(AggregateResult agr : countOfContact){
            mapOfContactCount.put((Id)agr.get('AccountId'),(Integer)agr.get('expr0'));
        }
        for(Contact conVar : conList){
            if(conVar.AccountId!=null && mapOfContactCount.get(conVar.AccountId)>0){
                conVar.addError('Only 1 Contact per account is allowed');
            }
        }
       
    }
}