public class myClass implements Queueable
{
string a;
string b;
public myclass()
{

}

public myClass (string a){
	this.a=a;
}

public myClass (string a,string b ){
	this.a=a;
	this.b=b;
}
public void execute(Queueablecontext context){
System.debug(a);
system.debug(b);
}
}