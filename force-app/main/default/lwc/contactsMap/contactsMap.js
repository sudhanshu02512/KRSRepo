import { LightningElement,api,wire } from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';
export default class ContactsMap extends LightningElement {
    @api recordId;
    renderedCallback(){
        console.log('record Id'+this.recordId);
    }
    @wire(getRelatedListRecords,{parentRecordId:'$recordId',relatedListId:'Contacts',fields: ['Contact.Name','Contact.Id']}) relatedContact(response){
        if(response.data){
            console.log(response.data);
        }
    }

}