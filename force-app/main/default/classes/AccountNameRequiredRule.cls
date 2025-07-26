public class AccountNameRequiredRule implements IValidationRule {
    public List<ValidationError> validate(List<SObject> records) {
        List<ValidationError> errors = new List<ValidationError>();
        for (SObject s : records) {
            Account acc = (Account)s;
            if (String.isBlank(acc.AccountNumber)) {
                errors.add(new ValidationError(acc.Id, 'Account Name is required'));
            }
        }
        return errors;
    }
}