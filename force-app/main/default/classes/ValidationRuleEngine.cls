public class ValidationRuleEngine {
	List<IValidationRule> rules = new List<IValidationRule>();
    
    public void add(IValidationRule rule){
        rules.add(rule);
    }
    
    public List<ValidationError> runRuleEngine(List<sObject> records){
        List<ValidationError> allErrors = new List<ValidationError>();
        
        for(IValidationRule rule : rules){
            allErrors.addAll(rule.validate(records));
        }
        return allErrors;
    }
}