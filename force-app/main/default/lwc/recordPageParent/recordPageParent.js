import { LightningElement,api } from 'lwc';
import getApplicationRecord from '@salesforce/apex/RecordPageParentController.getApplicationRecord';
import saveApplicationRecord from '@salesforce/apex/RecordPageParentController.saveApplicationRecord';
export default class RecordPageParent extends LightningElement {
    @api recordId;
    application;
    recordLoaded = false;
    get showSections(){
        return this.recordLoaded;
    } 
    connectedCallback() {
        this.populateInfo();
    }
    populateInfo(){
        getApplicationRecord({recordId: this.recordId}).then((data)=>{
            this.application = data;
            console.dir(data);
            this.recordLoaded = true;
            console.log('record Loaded')
        }).catch(e=>{
            console.log('error');
        })
    }

    fieldValueUpdateHandler(event){
        console.log(event);
        const field = event.detail.field;
        const value = event.detail.value;
        this.application[field]=value;
        console.log(this.application);
    }
    saveHandler(){
        const childComp1 = this.template.querySelector("c-record-page-section1");
        childComp1.getFieldValidity();
        //console.log(childComp1);
        // saveApplicationRecord({app: this.application}).then((res)=>{
        //     console.log(res);
        // }).catch(e=>{
        //     console.log(e);
        // })
    }
}