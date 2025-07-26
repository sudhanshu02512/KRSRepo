import { LightningElement,api } from 'lwc';
export default class ApiDecorator extends LightningElement {
    @api prop1;
    @api recordId;
    @api objectApiName;

    @api method1(){
        console.log('method1');
        
    }
    
}