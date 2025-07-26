import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin } from 'lightning/navigation';
import FORM_FACTOR from '@salesforce/client/formFactor'
export default class TextShare extends NavigationMixin(LightningElement) {
    textToShare;
    formFactor;

    connectedCallback(){
        this.formFactor = FORM_FACTOR;
    }

    openHandler(){
        const evt = new ShowToastEvent({
            title: 's',
            message: 'ms',
            variant: 'error',
            });
        this.dispatchEvent(evt);
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home',
            },
        });
    }
}