public class ValidationError {
	Id recordId;
    String errorMessage;
    
    public ValidationError(Id recordId, String errorMessage){
        this.recordId = recordId;
        this.errorMessage = errorMessage;
    }
}