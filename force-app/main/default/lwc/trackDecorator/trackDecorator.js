import { LightningElement,track } from 'lwc';
export default class TrackDecorator extends LightningElement {
    @track prop1 = ['Sudhanshu','ski',1];

    changeProperties(){
        this.prop1[2]=34;
        console.log(this.prop1[0]);
        console.log(this.prop1[1]);
        console.log(this.prop1[2]);
    }
    connectedCallback() {
        console.log('track Connected Callback');
    }

}