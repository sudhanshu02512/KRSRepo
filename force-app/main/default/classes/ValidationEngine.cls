public class ValidationEngine {
    private List<IValidationRule> rules = new List<IValidationRule>();

    public void addRule(IValidationRule rule) {
        rules.add(rule);
    }

    public List<ValidationError> runAll(List<SObject> records) {
        List<ValidationError> allErrors = new List<ValidationError>();
        for (IValidationRule rule : rules) {
            allErrors.addAll(rule.validate(records));
        }
        return allErrors;
    }
}