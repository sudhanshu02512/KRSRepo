@isTest
public class MyCalloutMock implements HttpCalloutMock {
    public Integer responseCode;
    public MyCalloutMock(){
        this.responseCode= 200;
    }
    public MyCalloutMock(Integer res){
        this.responseCode= res;
    }
	public HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        if(this.responseCode==200){
            response.setBody('{"animals": ["fake animal", "fake animal 2"]}');
        	response.setStatusCode(200);
        }
        else if(this.responseCode == 500){
            response.setBody(null);
        	response.setStatusCode(500);
        }
        
        return response;
    }
}