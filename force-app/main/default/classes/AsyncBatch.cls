public class AsyncBatch implements Database.Batchable<Sobject>,Database.Stateful {
    public Integer count=0;
    public Database.QueryLocator start(Database.BatchableContext cxt){
        System.debug('inside start');
        String query = 'Select Id from My_Custom_Object__c';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext cxt, List<My_Custom_Object__c> custRecords){
        List<My_Custom_Object__c> recordToUpdate = new List<My_Custom_Object__c>();
        My_Custom_Object__c myRecord;
        for(My_Custom_Object__c rc:custRecords){
            myRecord= new My_Custom_Object__c();
            myRecord.Name='Update from Batch';
            myRecord.id=rc.id;
            recordToUpdate.add(myRecord);
        }
        List<Database.SaveResult> srList =Database.update(recordToUpdate,false);
        for(Database.SaveResult sr:srList){
            if(!sr.isSuccess()){
                count++;
            }
        }
        
    }
    public void finish(Database.BatchableContext cxt){
        System.debug('inside finish');
        System.debug('failed'+count);
    }
}