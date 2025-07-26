import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Personal_Questionnaire__c.Name'
import { LightningElement, track, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import {
    subscribe,
    unsubscribe,
    onError,
    setDebugFlag,
    isEmpEnabled,
} from 'lightning/empApi';


export default class RealtimeTester extends LightningElement {
    @wire(getRecord,{recordId:'a0LdL000006LiHCUA0', layoutTypes:'Full' }) record;

    get name(){
        return getFieldValue(this.record.data,NAME_FIELD);
    }

    connectedCallback(){
        subscribe('/event/Personal_Questionaire__e', -1, async (response)=>{
            console.log(response.data.payload);
            await refreshApex(this.record);
        });
    }

}