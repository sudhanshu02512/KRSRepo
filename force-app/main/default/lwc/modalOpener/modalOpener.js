import { LightningElement } from 'lwc';
import MyModal from "c/userAccessRequest";
import { NavigationMixin } from "lightning/navigation";
import uarChannel from '@salesforce/messageChannel/uarChannel__c';
import {subscribe,MessageContext,createMessageContext} from 'lightning/messageService';

export default class ModalOpener extends NavigationMixin(LightningElement) {

     renderedCallback(){
        let context = createMessageContext();
          subscribe(
            context,
            uarChannel,
            (message) => {
              if(message.navigation=="Home"){
                this.navigateToHome();
              }
              else if(message.navigation=="Record"){
                this.navigateToRecord(message.recordId);
              }
            }
        );
         MyModal.open();
    }

    navigateToHome(){
          this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'User_Access_Request__c',
                actionName: 'list'
            },
            state: {
                filterName: 'Recent'
            }
        });  
    }

    navigateToRecord(recordId){
        this[NavigationMixin.Navigate]({
          type: 'standard__recordPage',
          attributes: {
              recordId: recordId,
              actionName: 'view'
          }
      });  
    }
    

}