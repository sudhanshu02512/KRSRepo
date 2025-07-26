import { LightningElement } from 'lwc';
import processRequest from '@salesforce/apex/UserAccessManagerController.processRequest';

export default class UserAccessNewRequest extends LightningElement {
    showNewRequestForm;
    showRequestMessage;
    showRequestTypeScreen;
    showSpinner;
    showSelectUser;
    requestId;
    constructor(){
        super();
        this.showNewRequestForm=true;
        this.showRequestMessage=false;
        this.showSpinner=false;
        this.showRequestTypeScreen=true;
        this.showSelectUser=false;
    }
    submitRequestHandler(event){
        this.showSpinner=true;
        event.preventDefault();
        Object.defineProperty(event.detail.fields, "Status__c", {value:"Pending"});
        //console.log(event.detail.fields);
        this.refs.newRequestForm.submit(event.detail.fields);
        
    }
    requestSuccessHandler(event){
        this.requestId = event.detail.id;
        this.showNewRequestForm=false;
        this.showRequestMessage=true;
        this.showSpinner=false;
        console.log(event);
        processRequest({requestId:this.requestId}).then((res)=>{
            console.log(res);
        }).catch((e)=>{
            console.log(e);
        })

    }

    activateUserHandler(event){
        this.showRequestTypeScreen=false;
        this.showSelectUser=true;
    }

}