import { LightningElement,track,wire } from 'lwc';
import getInformation from '@salesforce/apex/InformationFormController.getInformation';
import saveInformation from '@salesforce/apex/InformationFormController.saveInformation';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import PQ_OBJECT from "@salesforce/schema/Personal_Questionnaire__c";

export default class InformationForm extends LightningElement {
    @track information;
    employmentIncomeValue;
    disableFieldHandler;
    buttondDis=false;

    get chkPK(){
        // console.log(this.information.Chk_to_PL__c);
        // return this.information.Chk_to_PL__c ? true : false;
    }


    @wire(getObjectInfo, { objectApiName: PQ_OBJECT })
  pq(res){
    if(res){
        console.log(res);
    }
  };
    connectedCallback() {
        this.employmentIncomeValue= null;
        this.disableFieldHandler = this.employmentIncomeValue ? false : true;
        this.getData();
    }

    booleanPicklistFieldValue(event){
        return this.information[event.target.name] == 'Yes'? true : false;
    }

    incomeChange(event){
        console.log(isNaN(parseFloat(event.detail.value)) ? 0 : parseFloat(event.detail.value));
    }
    
    

    handleEmploymentChange(event){
       this.disableFieldHandler = event.detail.checked ? false : true;
       this.information[event.target.name] = event.detail.checked? 'Yes' : 'No';
       console.log(event.detail.checked);
    }
    getData(){
        getInformation({personalQuesId: 'a0LdL000005jyTSUAY'}).then(res=>{
            this.informationWrapper = res;
            this.information = res.personalQues;
            console.log(JSON.stringify(res));
        }).catch(error=>{
            console.log(error);
        })
    }
    saveHandler(){
        const allEle = this.template.querySelectorAll('lightning-input');
        console.log(allEle);

        this.informationWrapper.personalQues =  this.information;
        console.log(JSON.stringify(this.informationWrapper));
        saveInformation({informationWrapper:JSON.stringify(this.informationWrapper)}).then(res=>{
            console.log('res');
            console.log(res.savedMessage);
            console.log(JSON.stringify(res));
        }).catch(error=>{
            console.log(error);
        })
    }

}