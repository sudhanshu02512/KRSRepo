import { LightningElement, api,track,wire } from 'lwc';
import { getPicklistValues} from 'lightning/uiObjectInfoApi';
import PERSONAL_QUESTIONAIRE_OCCUPATION_FIELD from '@salesforce/schema/Personal_Questionnaire__c.Occupation__c';

export default class AsynchronousFlightFleetB extends LightningElement {
    _pqData2;
    @api  pqObject;
    @track occupationOptions;
    @api get pqData2() {
        return this._pqData2;
    }
    set pqData2(value) {
        this._pqData2 = value;
    }

    @wire(getPicklistValues,{recordTypeId:'$pqObject.defaultRecordTypeId',fieldApiName:PERSONAL_QUESTIONAIRE_OCCUPATION_FIELD}) getOccupationValues({error,data}){
        if(data){
            this.occupationOptions = data.values;
            console.log(data);
        }

    }

}