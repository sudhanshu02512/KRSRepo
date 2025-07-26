public class AsyncQueueClass implements Queueable {
    Id currentUserId;
    public AsyncQueueClass(Id userId){
        currentUserId=userId;
    }
    public AsyncQueueClass(){
        
    }
    public void execute(QueueableContext cxt){
        AsyncFuture.future3();
        String cron = '0 30 16 * * ?';
        System.schedule('Job1',cron, new AsyncSchedule());
        Database.executeBatch(new AsyncBatch());
    }
   
}