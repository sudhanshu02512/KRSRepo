import { LightningElement,wire } from 'lwc';
import { getObjectInfo } from "lightning/uiObjectInfoApi";

export default class ComboBox extends LightningElement {
    @wire(getObjectInfo, { objectApiName: 'Application__c' }) objectInfo(res){
        if(res.data){
            console.log(res.data.fields);
        }
    }

}