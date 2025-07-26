public class AsyncFuture {
    @Future
    public static void future2(){
        System.enqueueJob(new AsyncQueueClass(UserInfo.getUserId()));
        String cron = '0 30 16 * * ?';
        System.schedule('Job1',cron, new AsyncSchedule());
        Database.executeBatch(new AsyncBatch());
    }
    @Future
    public static void future3(){
        System.debug('Inside F3');
    }
}