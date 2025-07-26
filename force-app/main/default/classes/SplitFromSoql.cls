public class SplitFromSoql {
    public static void split(){
        List<Contact> conList = [Select Id,Name from Contact];
		//System.debug(conList.toString());
		String stList=  conList.toString();
        System.debug(stList);
		List<String> contSplit = stList.split(',');
        for(String st : contSplit){
            String st1 = st.remove('Contact:');
            String st2 = st1.remove('{');
            String st3 = st2.remove('}');
            String st4 = st3.remove('Id=');
            System.debug(st4);
        }
    }
}