public class HttpCallOut {
    public static void pinCodeApiCallout(){
        HttpRequest request= new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://api.postalpincode.in/pincode/201017');
        Http h1= new Http();
        HttpResponse hr=h1.send(request);
        system.debug(hr.getBody());
        
    }
    

}