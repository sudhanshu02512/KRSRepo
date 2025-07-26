let name='Sudhanshu';
   function f1(){
    console.log('inside function');
}

   class MyClass{
    nameProp='Sudhanshu';
    method1(){
        console.log('inside method');
    }
}

let obj1 = {
    prop1:'Hello',
    prop2:'Bye'
}
//Multiple export

export {name,f1,MyClass,obj1};