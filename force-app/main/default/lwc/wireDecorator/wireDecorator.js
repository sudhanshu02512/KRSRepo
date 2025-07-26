import { LightningElement,wire } from 'lwc';
import {getRecord,getFieldValue} from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';

export default class WireDecorator extends LightningElement {

    //@wire(adapterId, adapterConfig) propertyOrFunction;
    // Wire Adapters: Middleman between LWC and Salesforce Data
    // Basically these are function/properties which are resides inside the Adapter Modules.
    // Adapter Modules
    // 1.lightning/uiRecordApi - The lightning/uiRecordApi module includes wire adapters to record data and get default values to create records. It also includes JavaScript APIs to create, delete, update, and refresh records.
    // 2.lightning/uiFieldApi
    // 3. lightning/uiObjectInfoApi
    // 4. lightning/uiListsApi
    accountFields =[
        {
            "fieldApiName": "Name",
            "objectApiName": "Account"
        },
        {
            "fieldApiName": "Type",
            "objectApiName": "Account"
        },
        {
            "fieldApiName": "Fax",
            "objectApiName": "Account"
        }
    ];
    accID ='001dL00000116ShQAI';
    @wire(getRecord, {recordId: '$accID', layoutTypes:'Full'}) prop1;
    @wire(getRecord, {recordId: '001dL00000116ShQAI', fields:"$accountFields"}) prop2;
   

    handleClick(){
        //PROP1
        let nameFieldObject = {
            fieldApiName: "Name",
            objectApiName: "Account"
        }
        console.log(this.prop1);
        console.log(ACCOUNT_NAME_FIELD);
        let nameValue= getFieldValue(this.prop1.data,nameFieldObject);
        console.log('Name'+nameValue);

        //PROP 2 
        console.log(this.prop2);
        
    }

}