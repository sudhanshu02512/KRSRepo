public class StringQuestBank {
    public static void splitName(){
        String st = 'Sudhanshu Singh';
        List<String> words = st.split(' ');
        String fname = words[0];
        String lname = words[1];
        System.debug(fname);
        System.debug(lname);
    }
    
    public static void validatePhone(){
        String phone ='123-456-7890';
        String phoneFilter = phone.remove('-');
        System.debug(phoneFilter);
        System.debug(phoneFilter.length());
    }
    
    public static void extractEmail(){
        String emailStr = 'My email is sudhanshu024@gmail.com';
        Integer lastIndexOfSpace = emailStr.lastIndexOf(' ');
        //System.debug(lastIndexOfSpace);
        String email = emailStr.subString(lastIndexOfSpace+1);
        //System.debug(email);
        
        List<String> words = emailStr.split(' ');
        for(String word : words){
            if(word.contains('@')){
                System.debug(word);
            }
        }
        
    }
    
    public static void extractZipCode(){
        String add = 'flat 1101 Primrose Ghaziabad 201013';
        String zipCode = add.right(6);
        System.debug(zipCode);
    }
    
    public static void splitParameter(){
        String url = 'http://www.clothingstore.com/search?q=t-shirts&size=M&color=blue,red&material=cotton&brand=brand1,brand2&price=10-20&sort=new_arrivals';
        Integer indexOfQ = url.indexOf('?');
        String trimUrl = url.subString(indexOfQ+1);
        List<String> splitUrl = trimUrl.split('&');
        for(String word: splitUrl){
            List<String> parameters = word.split('=');
        }
    }
    
    public static void occurence(){
        String sen = 'Apple Banana Apple Guava Banana Apple';
        List<String> words = sen.split(' ');
        Map<String,Integer> mapOfWordCount = new Map<String,Integer>();
        for(String word:words){
            if(mapOfWordCount.get(word)==null){
                mapOfWordCount.put(word,1);
            }
            else{
                mapOfWordCount.put(word,mapOfWordCount.get(word)+1);
            }
        }
        for(String word: mapOfWordCount.keySet()){
            System.debug('Word: '+word+' Count: '+mapOfWordCount.get(word));
        }
        
        Set<String> setOfWords = new Set<String>();
        for(String word:words){
            setOfWords.add(word);
        }
        System.debug(String.join(setOfWords,' '));
    }
}