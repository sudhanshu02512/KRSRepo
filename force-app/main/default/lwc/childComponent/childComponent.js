import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {
    @api myProp1;
    @api myProp2;
    @api myProp3;
    @api myProp4;
    @api myProp5;

    firstName;
    lastName;
    myNumber=1;
    @api increaseNumBy1(){
        console.log(this.myNumber);
        this.myNumber=this.myNumber+1;
    }
    @api method2(){
        console.log('Method 2');
    }

    firstNameHandler(event){
        this.firstName=event.detail.value;
    }
    lastNameHandler(event){
        this.lastName=event.detail.value;
    }
    handleClick(){
        this.myProp5();
        const customEvent =  new CustomEvent('sendprop',{detail:{
            fname:this.firstName,
            lname:this.lastName
        }});
        this.dispatchEvent(customEvent);
    }
    connectedCallback() {
        this.addEventListener("click",()=>{
            console.log('component is clicked');
        })
        const ev = new Event("click");
        this.dispatchEvent(ev);
    }
}