import { LightningElement } from 'lwc';
export default class AsyncronousFeet extends LightningElement {

    constructor(){
        super();
        console.log('Inside Constructor');
    }

    connectedCallback() {
        console.log('Inside ConnectedCallback');
    }
}