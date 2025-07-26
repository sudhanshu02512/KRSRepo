public abstract class BaseTriggerHandler{
    public abstract void beforeInsert(List<SObject> newList);
    public abstract void beforeUpdate(List<SObject> newList, Map<Id,SObject> oldMap);

    public void run(TriggerContextHelper cxt){
        switch on cxt.operation{
            when BEFORE_INSERT {
                beforeInsert(cxt.newList);
            } 
        }
    }
}