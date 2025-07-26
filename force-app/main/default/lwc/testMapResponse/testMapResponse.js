import { LightningElement } from 'lwc';
import getMap from '@salesforce/apex/TestMapController.getMap';
export default class TestMapResponse extends LightningElement {
    connectedCallback() {
        getMap().then((res)=>{
            console.log(res);
            console.log(res.ResponseCode);
            console.log(res.Error);
        })
    }
}