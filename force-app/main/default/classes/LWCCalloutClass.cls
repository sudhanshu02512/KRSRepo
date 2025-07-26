public class LWCCalloutClass {
    
    public static void createRecordOnLwc(){
        try{
            HttpRequest request = new HttpRequest();
            //request.setEndp
        }
        catch(Exception e){
            
        }
    }
    
    /*public static void getRecordFromLwc(String sobjectName,Id recordId){
        try{
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:LWC_Org_Credentials/services/data/v62.0/sobjects/'+sobjectName+'/'+recordId);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Accept', 'application/json');
            
            Http http = new Http();
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200){
                System.debug(response.getBody());
                Account acc = (Account)JSON.deserialize(response.getBody(),Account.class);
                System.debug(acc.Id);
               	System.debug(acc.Name);
            }
            else{
                System.debug('Callout Failed: '+ response);
            }
         
        }
        catch(Exception e){
            System.debug(e);
        }
    }*/
}