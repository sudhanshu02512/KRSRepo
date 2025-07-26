public class AccountTriggerHandler {
    public static Boolean fRun =true;
    public static void updateSameAccount(List<Account> accList){
        if(fRun){
            fRun =false;
            for(Account acc:accList){
            	Account accVar = new Account();
            	accVar.Name='By Rec';
                accVar.Active__c = 'Yes';
            	accVar.id=acc.Id;
            	update accVar;
        	}
        }
        
    }
    
    public static void throwDML(List<Account> accList, Map<Id,Account> oldMap){
        for(Account acc:accList){
            if(acc.Region__c != oldMap.get(acc.Id).Region__c){
				//future1(UserInfo.getUserId());
				System.enqueueJob(new AsyncQueueClass(UserInfo.getUserId()));
            }
        }
    }
    
    @future
    public static void future1(Id userId){
		User user = new User();
        user.Id = userId;
        user.UserRoleId= '00EdL000000DKNgUAO';
        update user;        
    }
    
    public static void createContact(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        if(accList!=null){
            for(Account accVar:accList){
                if(accVar.No_of_Contacts__c !=null && accVar.No_of_Contacts__c >0){
                    for(integer i =0;i<accVar.No_of_Contacts__c;i++){
                        Contact conVar = new Contact();
                    	conVar.LastName='Test '+i;
                    	conVar.AccountId=  accVar.id;
                    	conList.add(conVar);
                    }
                }
            }
            if(conList!=null){
                insert conList;
            }
        }
    }
    
    public static void validateContact(List<Account> accList,Map<Id,Account> oldMap){
        if(accList!=null){
            Set<Id> accIds = new Set<Id>();
            for(Account accVar : accList){
                if(accVar.No_of_Contacts__c!=oldMap.get(accVar.Id).No_of_Contacts__c){
                    accIds.add(accVar.Id);
                }
            }
            List<Account> accListWithRelatedCon = [Select Id,(Select Id from Contacts order by createdDate asc) from Account where Id IN : accIds];
            Map<Id,List<Contact>> mapOfRelatedContact = new Map<Id,List<Contact>>(); 
            for(Account accVar : accListWithRelatedCon){
                mapOfRelatedContact.put(accVar.id,accVar.Contacts);
            }
            List<Contact> conListToBeDeleted = new List<Contact>();
            List<Contact> conListToBeInserted = new List<Contact>();
            
            for(Account accVar: accList){
                if(mapOfRelatedContact.get(accVar.Id)!=null){
                    Decimal newValue = accVar.No_of_Contacts__c;
                    Decimal oldValue = oldMap.get(accVar.Id).No_of_Contacts__c;
                    Decimal diff = newValue - oldValue;
                    if(diff<0){
                        //Delete Case
                        List<Contact> relatedCon = mapOfRelatedContact.get(accVar.Id);
                        for(Integer i = 0;i<Math.abs(diff);i++){
                            if(relatedCon[i]!=null){
                                conListToBeDeleted.add(relatedCon[i]);
                            }
                        }
                        
                    }
                    else if(diff>0){
                        //Insert Case
                        for(integer i =0 ;i<diff;i++){
                            Contact con = new Contact();
                            con.LastName = 'Test '+i;
                            con.AccountId= accVar.Id;
                            conListToBeInserted.add(con);
                            
                        }
                    }
                }
            }
            if(conListToBeDeleted!=null){
                delete conListToBeDeleted;
            }
            if(conListToBeInserted!=null){
                insert conListToBeInserted;
            }
        }
    }
    
    public static void synShippingAddress(List<Account> accList){
        for(Account accVar : accList){
            if(accVar.BillingStreet!=null){
                
            }
        }
    }
    
    public static void updatePhoneOnRelatedContacts(List<Account> accList,Map<Id,Account> oldMap,Map<Id,Account> newMap){
        Set<Id> accIds = new Set<Id>();
        for(Account accVar:accList){
            if(accVar.Phone!=oldMap.get(accVar.Id).Phone){
                accIds.add(accVar.Id);
            }
        }
        List<Contact> relatedContacts = [Select Id,Phone,AccountId from Contact where AccountId IN : accIds];
        List<Contact> conToUpdate = new List<Contact>();
        
        for(Contact conVar : relatedContacts){
            conVar.phone = newMap.get(conVar.AccountId).Phone;
            conToUpdate.add(conVar);
        }
        update conToUpdate;
    }
    
    
    public static void cloneAccountOnLwcOrg(List<Account> accList){
        for(Account accVar : accList){
            Account cloneAcc = accVar.clone(false,false,false,false);
            String body = accountToJson(accVar);
            calloutCloneAccountOnLwcOrg(body,accVar.Id);
        }
    }
    
    @future(callout=true)
    public static void calloutCloneAccountOnLwcOrg(String body,Id accId){
        try{
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:LWC_Org_Credentials/services/data/v62.0/sobjects/Account');
            request.setMethod('POST');
            request.setHeader('Content-Type','application/json');
            request.setHeader('Accept','application/json');
            request.setBody(body);
            Http http = new Http();
            HttpResponse response = http.send(request);
            ResponseWrapper responseBody = (ResponseWrapper)JSON.deserialize(response.getBody(),ResponseWrapper.class);
            
            //Update Id on Account
            System.debug(responseBody);
            Account accVar = new Account();
            accVar.Id = accId;
            accVar.LWC_Org_External_ID__c=responseBody.Id;
            update accVar;
        }
        catch(Exception e){
            
        }
    }
    
    public static String accountToJson(Account accVar){
        JSONGenerator jsonObject = JSON.createGenerator(false);
        jsonObject.writeStartObject();
        if(accVar.Name!=null){
            jsonObject.writeStringField('Name', accVar.Name);
        }
        if(accVar.Phone!=null){
            jsonObject.writeStringField('Phone', accVar.Phone);
        }
        jsonObject.writeEndObject();
        return jsonObject.getAsString();
    }
    
    private class ResponseWrapper{
        String id;
        Boolean success;
        List<String> errors;
    }
}