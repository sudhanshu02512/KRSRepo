public class JsonToApex {
    @future(callout = true)
    public static void toApex(){
        Http h = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        
        HttpResponse response = h.send(request);
        //System.debug(response.getBody());
        
        Custom_Metadata__mdt configMetadata = [select JSON__c from Custom_Metadata__mdt where DeveloperName ='myJson'];
        //Deserialize without Wrapper Class
        Map<String,Object> mapOfResponse = ( Map<String,Object>) JSON.deserializeUntyped(configMetadata.JSON__c);
        Map<String,Object> mapOfsourceObject = (Map<String, Object>) mapOfResponse.get('sourceObject');
       	List<Object> listOfAssignment = (List<Object>)mapOfsourceObject.get('sourceObjectFieldAssignment');
        //System.debug(listOfAssignment);
        
        //Deserialize with Wrapper 
        MyWrapper my = (MyWrapper)Json.deserialize(configMetadata.JSON__c,MyWrapper.class);
        System.debug(my);
    }
}