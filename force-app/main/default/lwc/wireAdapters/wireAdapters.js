import { LightningElement,wire } from 'lwc';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
import {getRelatedListRecords} from 'lightning/uiRelatedListApi';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class WireAdapters extends LightningElement {
    @wire(getObjectInfo,{objectApiName:{objectApiName:'Account'}}) accountObjectInfo({data,error}){
        //console.log(data);
        //console.log(error);
        //console.log(ACCOUNT_OBJECT);
    };
    @wire(getRelatedListRecords,{parentRecordId:'001dL00000116ShQAI',relatedListId:'Contacts',fields:['Contact.Name']}) relatedContactRecords({data,error}){
        //console.log(data);
        //console.log(error);
    }
    

    handleClick(){
        //console.log(this.accountObjectInfo);
    }
}