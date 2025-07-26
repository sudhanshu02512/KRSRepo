public class UserAccessRequest {
    public static void grantAccess(){
        List<User_Access_Request__c >  requestList= [Select Id,Start_Date__c,End_Date__c,Provision_Type__c,Request_Type__c,Frequency__c,Recurs_every_on__c from User_Access_Request__c where Start_Date__c <=TODAY and End_Date__c >=TODAY and Is_Active__c =false ];
        for(User_Access_Request__c request:requestList){
            if(request.Provision_Type__c=='Ad-Hoc' && request.Request_Type__c=='Activate User'){
                //Add user to activate list
            }
            else if(request.Provision_Type__c=='Ad-Hoc' && request.Request_Type__c=='Deactivate User'){
                // Add user to deactivate list
            }
            else if(request.Provision_Type__c=='Recurring' && request.Request_Type__c=='Activate User' && recurringRequestNeedsGrant(request)){
                System.debug('grant reurring access');
            }
        }
    }
    
    private static Boolean recurringRequestNeedsGrant(User_Access_Request__c request){
        // Check for weekly
        if(request.Frequency__c!=null && request.Frequency__c=='Weekly'){
            List<String> listOfWeekdays = request.Recurs_every_on__c.split(';');
            String dayoftheWeek = dayOfTheWeek(System.today());
            for(String weekday:listOfWeekdays){
                if(weekday==dayoftheWeek){
                    return true;
                }
            }
            return false;
            
        }
        else if(request.Frequency__c!=null && request.Frequency__c=='Monthly'){
            
        }
        return false;
    }
	
    private static String dayOfTheWeek(Date inputDate){
        Datetime inputDateTime = (DateTime)inputDate;
        String dayOfWeek = inputDateTime.format('EEEE');
        return dayOfWeek;
    }
    private static Integer dayOfTheMonth(Date inputDate){
       return inputDate.day();
    }
	    
}