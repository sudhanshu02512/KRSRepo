public class MyWrapper {
	public SourceObject sourceObject;
    
    public class SourceObject{
        public String sourceObjectName;
        public List<SourceObjectFieldAssignment> sourceObjectFieldAssignment;
        
    }
    
    public class SourceObjectFieldAssignment{
        public String sourceObjectField;
        public String value;
    }
}