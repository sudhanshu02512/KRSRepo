public class AsyncSchedule implements Schedulable {
    public void execute(SchedulableContext cxt){
        System.debug('Inside Schedule');
        AccountTriggerHandler.future1(UserInfo.getUserId());
    }
}