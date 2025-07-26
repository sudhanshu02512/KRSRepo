public class ValidationError {
	public Id recordId;
    public String errorMessage;

    public ValidationError(Id recordId, String errorMessage) {
        this.recordId = recordId;
        this.errorMessage = errorMessage;
    }
}