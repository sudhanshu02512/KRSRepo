import { LightningElement,api,wire,track } from 'lwc';
import {getRelatedListRecords} from 'lightning/uiRelatedListApi';
import { getFieldValue } from 'lightning/uiRecordApi';

import CONTACT_NAME_FIELD from '@salesforce/schema/Contact.Name';
import CONTACT_PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import CONTACT_EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import CONTACT_ID_FIELD from '@salesforce/schema/Contact.Id';

export default class RelatedContactRecords extends LightningElement {
    @api recordId;
    @track contactRecords=[];


    @wire(getRelatedListRecords,{parentRecordId:'$recordId',relatedListId:'Contacts',fields:['Contact.Name','Contact.Phone','Contact.Email','Contact.Id']}) contactRecordsWired({data,error}){
        if(data){
            let wiredContactRecords = data.records;
            //console.log(contactRecords);
            for(let i=0;i<wiredContactRecords.length;i++){
                let name = getFieldValue(wiredContactRecords[i],CONTACT_NAME_FIELD);
                let phone = getFieldValue(wiredContactRecords[i],CONTACT_PHONE_FIELD);
                let email = getFieldValue(wiredContactRecords[i],CONTACT_EMAIL_FIELD);
                let id = getFieldValue(wiredContactRecords[i],CONTACT_ID_FIELD);
               
                const contactRecord ={
                    name:name,
                    phone:phone,
                    email:email,
                    id:id
                }
                this.contactRecords.push(contactRecord);
                
            }
            console.log(this.contactRecords);
            
        }
        else{
            console.log(error);
        }
        
    }
}