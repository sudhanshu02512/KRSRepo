public with sharing class KQClock {
    public static Long startTime;
    public static Long stopTime;

    public static Long startTimer(){
        startTime = DateTime.now().getTime();
        return startTime;
    }

    public static Long stopTimer(){
        stopTime = DateTime.now().getTime();
        return stopTime;
    }

    public static Long getKRS(){
        return stopTime - startTime;
    }
    @future
    public static void logTime(String key,Long krs){
        KQClockLog__c kqlog = new KQClockLog__c();
        kqlog.Key__c = key;
        Kqlog.KRS__c = krs;
        insert kqlog;
    }
}