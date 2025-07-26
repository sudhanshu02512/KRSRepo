import { LightningElement,wire } from 'lwc';
import getMyRequest from '@salesforce/apex/UserAccessManagerController.getMyRequest';

export default class UserAcessTrackRequest extends LightningElement {
    columns;
    data=[];

    @wire(getMyRequest) getMyRequestData(res){
        if(res){
            this.data=res.data;
            
        }
    }
    constructor(){
        super();
        this.columns=[
            { label: 'Name', fieldName: 'Name', hideDefaultActions: true },
            { label: 'Status', fieldName: 'Status__c', hideDefaultActions: true },
            { label: 'Request Type', fieldName: 'Request_Type__c', hideDefaultActions: true },
            { label: 'Access Type', fieldName: 'Access_Type__c', hideDefaultActions: true },
        ]
    }
}