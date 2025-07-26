public class StringEmailQuest {
    public static void getEmail(){
        String str = 'Hello My email is sudhanshu02512@gmail.com  @ das@';
        String email;
        //To break down each word
        List<String> words = str.split(' ');
        for(String word: words){
            if(word.contains('@') && validateEmail(word)){
                email = word;
            }
        }
        System.debug(email);
    }
    
    public static boolean validateEmail(String email){
        List<String> emailSplit = email.split('@');
        if(emailSplit.size()==2){
            String emailprefix = emailSplit[0];
            String domain = emailSplit[1];
            String emailPrefixReg = '[a-zA-Z0-9.]';
            Pattern emailPrefixPattern = Pattern.compile(emailPrefixReg);
            Matcher emailPreMatcher = emailPrefixPattern.matcher(emailprefix);
            if(emailPreMatcher.matches()){
                return true;
            }
            else{
                return false;
            }
        }
        else{
            return false;
        }
        
    }
}