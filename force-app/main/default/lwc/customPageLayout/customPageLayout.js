import { api, LightningElement } from 'lwc';

export default class CustomPageLayout extends LightningElement {
    @api recordId;

    saveButtonHandler(){
        
    }

    nextButtonHandler(){
        const childComponent = this.template.querySelector('c-custom-field-section');
        childComponent.validateAddress();
    }
}