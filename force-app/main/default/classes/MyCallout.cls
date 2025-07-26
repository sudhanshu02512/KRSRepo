public class MyCallout {
    public static HttpResponse invokeCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animalsre');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        
        if(response.getBody()==null){
            String as2 = 'Sudhansu';
            if(as2=='Sudhanshu'){
                Integer i = 1+4;
            }
            System.debug('NUll Body');
        }
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
            }
        }
        else{
            System.debug(response);
        }
        return response;
    }
    public static void invokeCallout2(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.google.com');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
    }
    public static void invokeCallout3(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.postalpincode.in/pincode/201013');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response.getBody());
    }
}