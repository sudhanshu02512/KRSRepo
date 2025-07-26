public interface IValidationRule {
    // Takes records and returns list of validation errors
    List<ValidationError> validate(List<SObject> records);
}