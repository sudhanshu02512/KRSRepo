import { LightningElement,wire,track,api } from 'lwc';
import searchUsersBasic from '@salesforce/apex/UserAccessManagerController.searchUsersBasic';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class MultiLookup extends LightningElement {
    searchKey='';
    searchResult=[];
    @track selectedOptions=[];
    @track selectedOptionsMap = new Map();
    @api selectedOptionApi;
    @wire(searchUsersBasic,{searchKey:'$searchKey'}) searchRecords(res){
        if(res.data){
            this.searchResult= res.data;
            console.log(res.data);
        }
        else{
            console.log(res.error);
        }
    }
    
    
    searchBoxInputHandler(event){
        console.log(event.target.value);
        this.searchKey=event.target.value;
    }

    searchBoxFocusHandler(){
        let dropDownTriggerElement = this.template.querySelector('.slds-dropdown-trigger');
        dropDownTriggerElement.classList.add('slds-is-open');
    }
    searchBoxClickHandler(){
        let dropDownTriggerElement = this.template.querySelector('.slds-dropdown-trigger');
        if(dropDownTriggerElement.classList.contains('slds-is-open')){
            dropDownTriggerElement.classList.remove('slds-is-open');
        }
        else{
            dropDownTriggerElement.classList.add('slds-is-open');
        }
    }

    searchItemClickHandler(event){
        if(!this.selectedOptionsMap.has(event.target.dataset.id) && event.target.dataset.id!=null){
            let selectedOption ={
                Id:event.target.dataset.id,
                Username:event.target.dataset.username,
                Name:event.target.dataset.name
            }
            this.selectedOptionsMap.set(event.target.dataset.id,selectedOption);
            this.selectedOptions=[];
            this.selectedOptionsMap.forEach(element => {
                this.selectedOptions.push(element);
            });
            this.selectedOptionApi = this.selectedOptions;
            let dropDownTriggerElement = this.template.querySelector('.slds-dropdown-trigger');
            dropDownTriggerElement.classList.remove('slds-is-open');
        }
        else if (this.selectedOptionsMap.has(event.target.dataset.id)){
            const evt = new ShowToastEvent({
                title: 'Information',
                message: 'Already Selected',
                variant: 'error',
              });
            this.dispatchEvent(evt);
            let dropDownTriggerElement = this.template.querySelector('.slds-dropdown-trigger');
            dropDownTriggerElement.classList.remove('slds-is-open');
        }
    }

    removeOptionHandler(event){
        console.log('Remove');
        let selectedOptionId = event.target.dataset.id;
        this.selectedOptionsMap.delete(selectedOptionId);
        this.selectedOptions=[];
        this.selectedOptionsMap.forEach((element)=>{
            this.selectedOptions.push(element);
        })
        this.selectedOptionApi = this.selectedOptions;
    }

}