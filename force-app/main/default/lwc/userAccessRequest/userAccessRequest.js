import {api, LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";
import createUar from '@salesforce/apex/UserAccessManagerController.createUar';
import uarChannel from '@salesforce/messageChannel/uarChannel__c';
import {publish,MessageContext,createMessageContext} from 'lightning/messageService';

import LightningModal from 'lightning/modal';

export default class UserAccessRequest extends NavigationMixin(LightningModal) {
    recordId;
    objectApiName;
    isRecurring;
    constructor() {
        super();
        this.objectApiName = 'User_Access_Request__c';
    }
    provisionTypeHandler(event) {
        if (event.target.value == 'Recurring') {
            this.isRecurring = true;
        }
        else {
            this.isRecurring = false;
        }
    }
    cancelHandler() {
        this.close();
        let context = createMessageContext();
        let message = { 
            navigation:"Home"
        };
        publish(context,uarChannel,message);
        console.log('publish');
        
    }

    async submitHandler(event){
        event.preventDefault();
        const selectedUser = this.template.querySelector('c-multi-lookup').selectedOptionApi;
        console.log(event.detail);
        // let insertResult = await createUar({
        //     userList:selectedUser,
        //     uarRecord:event.detail.fields
        // });
        // console.log(insertResult);
        // let context = createMessageContext();
        // let message = { 
        //     navigation:"Record",
        //     recordId:insertResult[0].Id
        // };
        // publish(context,uarChannel,message);
        // this.close();
        
    }
    saveHandler(){
        const el = this.querySelector('c-modal-opener');
        console.log(el);
        const btn = this.template.querySelector( ".hidden" );
        if( btn ){ 
            btn.click();
        }
    }
}