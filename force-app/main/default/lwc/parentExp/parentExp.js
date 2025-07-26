import { LightningElement } from 'lwc';

export default class ParentExp extends LightningElement {
    mesgFromA ="d";
    renderedCallback(){
        this.template.querySelector('c-child-exp').childMethod1();
    }
    parentMethod1(){
        console.log('inside parent method');
    }
    infoFromChild(event){
        console.log(event.detail.m1);
        this.msgFromA=event.detail.m1;
    }
}