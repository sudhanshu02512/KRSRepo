public interface IValidationRule {
	List<ValidationError> validate(List<sObject> records);
}