import { LightningElement,api } from 'lwc';
export default class ChildHook extends LightningElement {
    childProp='Child Prop';
    @api pubProp;
    constructor(){
        super();
        console.log('child is created');
    }
    connectedCallback() {
       console.log('child is inserted');
       //console.log(childProp);
    }
    renderedCallback(){
        console.log('child is rendered');
    }
    disconnectedCallback() {
        console.log('child is deleted');
    }
    errorCallback(error, stack) {
        console.log('error occured on child child');
        console.log(error.message);
        console.log(error.stack);
        console.log(stack);
    }
    changeProp(){
        this.childProp='Change Child Prop';
    }
}