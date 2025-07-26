trigger KMeaureAccountTrigger on Account (after update) {
    KQClock.startTimer();
	if(trigger.isAfter && trigger.isUpdate){
        for(Account accVar : trigger.new){
            if(accVar.Phone != trigger.oldMap.get(accVar.Id).Phone){
                List<Contact> conList = [Select Id,Phone from Contact where AccountId=:accVar.Id];
                for(Contact convar : conList){
                    conVar.Phone = accVar.Phone;
                    update conVar;
                }
            }
        }
    }
    KQClock.stopTimer();
    KQClock.logTime('KMeaureAccountTrigger',KQClock.getKRS());
}