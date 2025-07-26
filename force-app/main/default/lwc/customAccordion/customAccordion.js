import { LightningElement } from 'lwc';
export default class CustomAccordion extends LightningElement {
    renderedCallback(){
        console.dir(this);
        console.dir(this.template);
    }
}