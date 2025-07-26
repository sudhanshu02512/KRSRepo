public class UserAccessManagerQueueable implements Queueable {
    Id requestId;
    String requestType;
    Id userId;
    
    public UserAccessManagerQueueable(Id requestId, String requestType, Id userId){
        this.requestId = requestId;
        this.requestType = requestType;
        this.userId = userId;
    }
    
    public void execute(QueueableContext cxt){
        List<sObject> recordToUpdate = new List<sObject>();
        if(this.requestId!=null && this.requestType=='Activate User' && this.userId!=null){
            
            User userToActivate = new User();
            userToActivate.Id= this.userId;
            userToActivate.IsActive=true;
            recordToUpdate.add(userToActivate);
            UserAccessManagerController.resolveRequest(this.requestId);
        }
        else if(this.requestId!=null && this.requestType=='Deactivate User' && this.userId!=null){
            User userToActivate = new User();
            userToActivate.Id= this.userId;
            userToActivate.IsActive=false;
            update userToActivate;
            UserAccessManagerController.resolveRequest(this.requestId);
         	
        }
        
        if(!recordToUpdate.isEmpty()){
            update recordToUpdate;
        }
    }
}