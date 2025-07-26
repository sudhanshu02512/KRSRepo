public class Encapsulate {
	String name;
    void method1(){
        System.debug('Inside method');
    }
    public String getName(){
        return name;
    }
    public String setName(String name){
        this.name =name;
        return this.name;
    }
}