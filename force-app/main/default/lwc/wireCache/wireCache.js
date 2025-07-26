import { LightningElement,api,wire } from 'lwc';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import {getRecord,getFieldValue} from 'lightning/uiRecordApi';

export default class WireCache extends LightningElement {
    @api recordId;
    accountName;

    @wire(getRecord,{recordId:'$recordId',layoutTypes:'Full'}) recordMethod1({data,error}){
        this.accountName= getFieldValue(data,ACCOUNT_NAME_FIELD);
    }
}