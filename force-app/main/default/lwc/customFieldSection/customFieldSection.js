import { api, LightningElement } from 'lwc';

export default class CustomFieldSection extends LightningElement {
    showModal = false;
    
    @api validateAddress(){
        this.showModal = true;
    }
    saveHandler(){

    }
    @api closeAddressModal(){
        this.showModal = false;
    }

}