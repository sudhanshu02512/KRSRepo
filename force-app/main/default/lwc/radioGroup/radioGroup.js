import { LightningElement } from 'lwc';
export default class RadioGroup extends LightningElement {
    get label(){
        return 'Are you sure?';
    }
    get options(){
        return [
            { label: 'Yes', value: 'Yes' },
            { label: 'No', value: 'No' }
        ]
    }

    renderedCallback(){
        // const radioGroupElement = this.template.querySelector('.radio-group');
        // const style = document.createElement('style');
        // style.innerText = `
        //     .slds-form-element__control{
        //         display:flex;
        //     }
        //     .slds-form-element__legend.slds-form-element__label{
        //         font-weight:normal;
        //     } 
        // `;
        // radioGroupElement?.appendChild(style);

        // console.log(this.template.querySelector('.radio-group')
        // ?.querySelector('lightning-radio-group'));

        // console.log(this.template.querySelector('.radio-group')
        // ?.querySelector('lightning-radio-group')
        // ?.querySelector('fieldset'));
        
    }
}