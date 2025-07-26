@RestResource(urlMapping='/Account/*')
global class ApexRestService {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        String url = request.requestURI;
        String accountId = url.subString(url.lastIndexOf('/')+1);
        Account acc = [Select Id,Name from Account where Id=:accountId];
        return acc;
    }
}