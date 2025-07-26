import { LightningElement,api } from 'lwc';
import { getSObjectValue } from "@salesforce/apex";

//import APPLICATION_REASON_FIELD from '@salesforce/schema/Application__c.Reason__c';

export default class RecordPageSection1 extends LightningElement {
    @api app;
    reason;
    applicationType;

    constructor(){
        super();
    }
    reasonChangeHandler(event){
        console.log(event.target.name);
        this.updateFieldValue('Reason__c',event.detail.value);
    }
    applicationTypeChangeHandler(event){
        this.updateFieldValue('Application_Type__c',event.detail.value);
    }

    updateFieldValue(field,value){
        console.log(this.template.querySelectorAll('lightning-input'));
        const fieldValueUpdateEvent = new CustomEvent('fieldvalueupdated',{
            detail:{
                field:field,
                value:value
            }
        })
        this.dispatchEvent(fieldValueUpdateEvent);
    }

    @api getFieldValidity(){
        let valid = false;
        const inputElement = this.template.querySelectorAll('lightning-input');
        const result = inputElement.forEach(currentItem => {
            console.log(currentItem);
            const reportVal = currentItem.reportValidity();
            console.log(reportVal);
        });
        console.log('ALL RESULT');
        console.log(result);
    }
}