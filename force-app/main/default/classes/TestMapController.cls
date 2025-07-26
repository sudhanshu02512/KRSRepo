public class TestMapController {
	@AuraEnabled
    public static Map<String,String> getMap(){
        Map<String,String> myMap = new Map<String,String>();
        myMap.put('ResponseCode','200');
        myMap.put('Error','Error:dsds');
        return myMap;
    }
}