import { LightningElement, wire } from 'lwc';
import getSamplePQData from '@salesforce/apex/ApexController.getSamplePQData';
import getSamplePQData2 from '@salesforce/apex/ApexController.getSamplePQData2';
import getSampleOpportunityData from '@salesforce/apex/ApexController.getSampleOpportunityData'; 
import getSampleAccountData from '@salesforce/apex/ApexController.getSampleAccountData';
import getSampleContactData from '@salesforce/apex/ApexController.getSampleContactData'; 

// import { getObjectInfo } from 'lightning/uiObjectInfoApi';
// import PERSONAL_QUESTIONAIRE_OBJECT from '@salesforce/schema/Personal_Questionnaire__c';

export default class AsynchronousFlight extends LightningElement {

    samplePQData;
    samplePQData2;
    sampleAccountData;
    sampleContactData;
    sampleOpportunityData;
    pqObject;

    // @wire(getObjectInfo, {objectApiName:PERSONAL_QUESTIONAIRE_OBJECT}) getPqObject({error,data}){
    //     console.log('ObjectInfo');
    //     if(data){
    //         this.pqObject = data;
    //         console.log(data);
    //     }
    //     else{
    //         console.log(error);
    //     }
    // }

    @wire(getSamplePQData,{}) getData3({error,data}){
        console.log('wire 1 getSamplePQData');
        if(data){
            console.log(data);
            this.samplePQData = data[0];
        }
        else{
            console.log(error);
        }
    }

    @wire(getSampleContactData,{}) getData1({error,data}){
        console.log('wire 2 getSampleContactData');
        if(data){
            //console.log(data);
        }
        else{
            console.log(error);
        }
    }

    @wire(getSampleOpportunityData,{}) getData2({error,data}){
        console.log('wire 3 getSampleOpportunityData');
        if(data){
            //console.log(data);
        }
        else{
            console.log(error);
        }
    }
    
    // get showSection(){
    //     console.log('SHOW SECTION');
    //     console.log(this.samplePQData);
    //     return this.samplePQData && this.samplePQData2 ? true : false;
    // }

    constructor(){
        super();
        console.log('Inside Constructor');
    }

    connectedCallback(){
        console.log('Inside connectedCallback');
        getSampleAccountData().then((result)=>{
            console.log('imperative 1 getSampleAccountData');
            //console.log(result);
        });
        getSamplePQData2().then((result)=>{
            console.log('imperative 2 getSamplePQData2');
            //console.log(result);
            this.samplePQData2 = result[0];
        });
        
    }

    renderedCallback(){
        console.log('Inside renderedCallback');
    }

    disconnectedCallback(){
        console.log('Inside disconnectedCallback');
    }

    
}