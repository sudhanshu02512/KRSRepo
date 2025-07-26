public class InvocableApex {
	@InvocableMethod(label = 'Label apex'  description ='apex description')
    public static void invokeMethod(List<Input> ip){
        
        System.debug('Invoked');
    }
    
    public class Input{
        @InvocableVariable
        public  List<String> inp1;
        @InvocableVariable
        public String inp2;
    }
}