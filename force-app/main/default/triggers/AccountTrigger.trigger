trigger AccountTrigger on Account (before insert, before update) {
    if(trigger.isBefore){
        ValidationRuleEngine engine = new ValidationRuleEngine();
        engine.add(new Rule1());
        for(ValidationError error : engine.runRuleEngine(trigger.new)){
            
        }
    }
    
}