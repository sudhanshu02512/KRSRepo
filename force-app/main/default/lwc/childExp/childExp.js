import { api, LightningElement } from 'lwc';

export default class ChildExp extends LightningElement {
    @api childMethod1(){
        console.log('child method');
    }
    @api propMethod;

    renderedCallback(){
        this.propMethod();
    }
    buttonHandler(){
        const custEv = new CustomEvent('myevent',{
            detail:{
                m1:"Sudhanshu"
            }
        });
        this.dispatchEvent(custEv);
    }
}