import { api, LightningElement, track, wire } from 'lwc';
import { getFieldValue } from 'lightning/uiRecordApi';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';
import CONTACT_NAME_FIELD from '@salesforce/schema/Contact.Name';
import CONTACT_PHONE_FIELD from '@salesforce/schema/Contact.Phone';

export default class ContactTable extends LightningElement {
    @api recordId;
    @track data=[];
    @wire(getRelatedListRecords,{parentRecordId:'$recordId',relatedListId:'Contacts',fields:['Contact.Name','Contact.Phone']}) relatedContact(res){
       if(res.data){
        let records=[];
            for(let i = 0;i<res.data.records.length;i++){
                let record = res.data.records[i];
                let name = getFieldValue(record,CONTACT_NAME_FIELD);
                let phone = getFieldValue(record,CONTACT_PHONE_FIELD);
                let id = res.data.records[i].id;
                let object = {Name:name,Phone:phone,Id:id};
                records.push(object);
            }
            this.data = records;
            //console.log(records);
       }
    };
    columns=[
        {label:'Name', fieldName:'Name', type:'url',typeAttributes: {label: { fieldName: 'Name' }, target: '/Id'}},
        {label:'Phone','fieldName':'Phone'}
    ]
}