public with Sharing class UserAccessManagerController  {
    
	private class SearchParameter{
        String searchQuery;
        Boolean activeFilter;
        Map<String,String> fieldFilters;
    }
    
    @AuraEnabled(cacheable=true)
    public static User_Access_Request__c getUser(){
        List<User_Access_Request__c> userList = [Select Id,Name,User__r.Name from User_Access_Request__c];
            User_Access_Request__c us = userList[0];
        return us;
    }
    @AuraEnabled(cacheable=true)
    public static List<User> searchUsers(String searchParameters){
        if(searchParameters!=null){
            SearchParameter parameters = (SearchParameter)JSON.deserialize(searchParameters,SearchParameter.class);
            if(parameters.searchQuery==null || parameters.searchQuery==''){
                return [Select Id,Name,Username,Email,Phone from User order by Name];
            }
            else if(parameters.searchQuery!=null){
                List<List<sObject>> searchResult = [Find :parameters.searchQuery IN ALL FIELDS RETURNING USER(Id,Name,Username,Email,Phone)];
                if(searchResult!=null){
                    if(searchResult[0]!=null){
                        List<User> searchUsersList = (List<User>)searchResult[0];
                        return searchUsersList;
                    }
                }
            }
        }
        return null;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<User> searchUsersBasic(String searchKey){
        if(searchKey==null || searchKey==''){
            return [Select Id,Name,Username,Profile.Name from User];
        }
        else{
            List<List<sObject>> searchResult = [Find :searchKey IN ALL FIELDS RETURNING USER(Id,Name,Username,Email,Phone)];
        	if(searchResult!=null){
                    if(searchResult[0]!=null){
                        List<User> searchUsersList = (List<User>)searchResult[0];
                        return searchUsersList;
            	}
        	}
        }
        return null;
    }
    
    @AuraEnabled
    public static List<User_Access_Request__c> createUar(List<User> userList, User_Access_Request__c uarRecord){
        if(userList!=null && uarRecord!=null){
            List<User_Access_Request__c> uarToCreate = new List<User_Access_Request__c>();
            for(User userRecord : userList){
                User_Access_Request__c uarVar =  uarRecord.clone(false,true,false,false);
                uarVar.User__c=userRecord.Id;
                uarToCreate.add(uarVar);
            }
            
            if(!uarToCreate.isEmpty()){
                insert uarToCreate;
                return uarToCreate;
            }
            else{
                return null;
            }
        }
        else{
            return null;
        }
    }
    
    
    
    
    //Other
    @AuraEnabled(cacheable=true)
    public static List<User> getAllUser(){
        List<User> userList = [Select Id,Name,UserName,Email,Phone From User];
        return userList;
    }
    
    
    
    
    /*@AuraEnabled
    public static Boolean processRequest(Id requestId){
        try{
            User_Access_Request__c request = [Select Id,User__c,Request_Type__c,Start_Date__c,End_Date__c from User_Access_Request__c where Id=:requestId];
            if(request!=null){
                if(request.Start_Date__c==Date.today()){
                    request.Status__c='In Progress';
                    System.enqueueJob(new UserAccessManagerQueueable(request.Id,request.Request_Type__c,request.User__c));
                    update request;
                }
            }
            return true;
        }
        catch(Exception e){
            System.debug(e);
            return false;
        }
    }*/
    
    /*@AuraEnabled(cacheable =true)
    public static List<User_Access_Request__c> getMyRequest(){
        	List<User_Access_Request__c> myRequest = [SELECT Id,Name,Status__c,Request_Type__c,Access_Type__c FROM User_Access_Request__c where OwnerId=:UserInfo.getUserId() order by createdDate desc];
        	return myRequest;
    }*/
    
    /*@future
    public static void resolveRequest(Id requestId){
        User_Access_Request__c request = new User_Access_Request__c();
        request.Id = requestId;
        request.Status__c='Resolved';
        update request;        
    }*/
    
    
}