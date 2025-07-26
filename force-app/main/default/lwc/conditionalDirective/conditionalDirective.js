import { LightningElement } from 'lwc';
import appleImage from '@salesforce/resourceUrl/apple_logo';

export default class ConditionalDirective extends LightningElement {
    companyOptions =[
            { label: 'Apple', value: 'apple' },
            { label: 'Google', value: 'google' },
            { label: 'Microsoft', value: 'microsoft' }
    ];
    selectedValue;
    showSelectScreen=true;
    showAppleTemplate=false;
    showGoogleTemplate=false;
    showMicrosoftTemplate=false;

    optionSelectedHandler(event){
        this.selectedValue=event.detail.value;
        
    }
    nextButtonHandler(){
        //const radioElement = this.template.querySelector('lightning-radio-group[data-id="radio-option"]');
        //let value = radioElement.value;
        let value = this.selectedValue;
        if(value=='apple'){
            this.showAppleTemplate=true;
            this.showGoogleTemplate=false;
            this.showMicrosoftTemplate=false;
            this.showSelectScreen=false;
        }
        else if(value=='google'){
            this.showAppleTemplate=false;
            this.showGoogleTemplate=true;
            this.showMicrosoftTemplate=false;
            this.showSelectScreen=false;
        }
        else if(value=='microsoft'){
            this.showAppleTemplate=false;
            this.showGoogleTemplate=false;
            this.showMicrosoftTemplate=true;
            this.showSelectScreen=false;
        }
        else{
            this.showAppleTemplate=false;
            this.showGoogleTemplate=false;
            this.showMicrosoftTemplate=false;
            this.showSelectScreen=true;
        }
    }
    backButtonHandler(){
        this.showAppleTemplate=false;
        this.showGoogleTemplate=false;
        this.showMicrosoftTemplate=false;
        this.showSelectScreen=true;
    }
    
}