public class StringReverseQuest {
    public static void reverseString(){
        String str = 'Today\'s weather is rainy';
        String rev = str.reverse();
        //System.debug(rev);
        String rev1='';
        
        //without reverse
        for(integer i=str.length()-1;i>-1;i--){
            rev1 = rev1 + String.fromCharArray(new List<Integer>{str.charAt(i)});
        }
        //System.debug(rev1);
        
        //2
        String rev2='';
        
    }
}