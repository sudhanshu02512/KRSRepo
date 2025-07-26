import { LightningElement,wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';

export default class WireExperimental extends LightningElement {
    @wire(getRecord,{ recordId:'001dL00000116SjQAI', layoutType:'Full'}) method1(){
        console.log('Wire Method');
    }
}