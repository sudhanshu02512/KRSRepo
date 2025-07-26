import { LightningElement,wire } from 'lwc';
import divineChannel from '@salesforce/messageChannel/divineChannel__c';
import {publish,MessageContext,createMessageContext} from 'lightning/messageService';

export default class LmsComponent extends LightningElement {

    // @wire(MessageContext) messageContext;

    messagePublisher(event){
        let context = createMessageContext();
        let message = { 
            myMessage:"Hello",
            m2:"dsaj",
            p1:12
        };
        publish(context,divineChannel,message);
    }
}