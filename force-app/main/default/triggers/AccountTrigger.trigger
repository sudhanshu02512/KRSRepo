trigger AccountTrigger on Account (before insert, before update) {
    if (Trigger.isBefore) {
        ValidationEngine engine = new ValidationEngine();
        engine.addRule(new AccountNameRequiredRule());

        List<ValidationError> errors = engine.runAll(Trigger.new);

        for (ValidationError error : errors) {
            for (Account acc : Trigger.new) {
                if (acc.Id == error.recordId || acc.Id == null) {
                    acc.addError(error.errorMessage);
                }
            }
        }
    }
}