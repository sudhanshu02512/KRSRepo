import { LightningElement,track } from 'lwc';
import { isCommercialApplication,isCommercialType } from 'c/utility';

export default class ImportJsChildComponent extends LightningElement {
    isCommercial =false;
    @track myVar;
    connectedCallback(){
        this.setCommercial();
    }
    get isConsumer() {
        return !this.isCommercial;
    }
    setCommercial(){
        isCommercialType().then(result => {
            this.isCommercial = result;
            console.log(result);
        });
    }
}