public class httpCalloutApex {
	@future(callout = true)
    public static void call(){
        SavePoint sv = Database.setSavePoint();
        try{
            Http h = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('GET');
            HttpResponse response = h.send(request);
            System.debug(response.getBody());
            Account acc = new Account();
            acc.name='from callout';
            insert acc;
            
        }catch(Exception e){
            System.debug(e);
            Database.rollback(sv);
    		Database.releaseSavepoint(sv);
        }

    }
}