public class StringQuest {
    public static void splitParameter(){
        String url = 'http://www.clothingstore.com/search?q=t-shirts&size=M&color=blue,red&material=cotton&brand=brand1,brand2&price=10-20&sort=new_arrivals';
        String queryString = url.subString(url.indexOf('?')+1);
        Map<String,String> mapOfParameters = new Map<String,String>();
        
        //System.debug(queryString);
        List<String> paramStr = queryString.split('&');
        for(String pr:paramStr){
            List<String> paraPair = pr.split('=');
            mapOfParameters.put(paraPair[0],paraPair[1]);
        }
        for(String key:mapOfParameters.keySet()){
            System.debug(mapOfParameters.get(key));
        }
        
    }
}