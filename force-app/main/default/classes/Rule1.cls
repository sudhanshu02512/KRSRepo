public class Rule1 implements IValidationRule {
    public List<ValidationError> validate(List<Account> accList){
        List<ValidationError> errorList= new List<ValidationError>();
        for(Account accVar : accList){
            if(String.isBlank(accVar.Phone)){
                errorList.add(new ValidationError(accVar.Id, 'Phone is required'));
            }
        }
        return errorList;
    }
}