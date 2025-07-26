public class MyClass2 {
    
    public class RespWrap{
        @AuraEnabled public String response;
        @AuraEnabled public Boolean generateContractResult;
    }
    
    @AuraEnabled
    public static RespWrap getResponse(){
        Account acc = new Account();
        acc.Name='Sudhanshu';
        RespWrap wr = new RespWrap();
        wr.response = '';
        wr.generateContractResult = true;
        System.debug(wr);
        return wr;
    } 
}