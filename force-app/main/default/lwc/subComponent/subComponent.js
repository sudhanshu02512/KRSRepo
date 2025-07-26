import { LightningElement,wire } from 'lwc';
import divineChannel from '@salesforce/messageChannel/divineChannel__c';
import { subscribe,MessageContext } from 'lightning/messageService';

export default class SubComponent extends LightningElement {
    @wire(MessageContext) messageContext;
    subcription;
    connectedCallback(){
        this.subcription= subscribe(this.messageContext,divineChannel,this.messageReceived);
    }
    messageReceived(message){
        console.log(message);
    }
}