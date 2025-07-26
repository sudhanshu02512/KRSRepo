public class ApexSOSL {
    public static void runApex(){
       List<List<SObject>> objectList = [FIND 'Sudhanshu'  RETURNING Account(Name),User];
       List<Sobject> sobject1list=  objectList[0];
        for(Sobject sb:sobject1list){
            System.debug(sb.get('Name'));
        }
    }
}