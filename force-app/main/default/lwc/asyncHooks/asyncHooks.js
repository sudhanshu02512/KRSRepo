import { LightningElement } from 'lwc';
import apexMethod from '@salesforce/apex/ApexToLwc.toLwc';

export default class AsyncHooks extends LightningElement {
    constructor(){
        super();
        console.log('Inside Constructor');
    }
    async connectedCallback(){
        console.log('inside connectedCallback');
        let a = await apexMethod({accId:'001dL00000116SeQAI'});
        console.log(a);
    }
    renderedCallback(){
        console.log('inside rendered Callback');
    }
}