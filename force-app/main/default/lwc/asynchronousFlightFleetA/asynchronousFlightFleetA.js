import { LightningElement,api } from 'lwc';

export default class AsynchronousFlightFleetA extends LightningElement {
    
    _pqData1;

    @api get pqData1(){
        return this._pqData1;
    }
    set pqData1(value){     
        this._pqData1 = value;
        // console.log('Fleet A');
        // console.log(this._pqData1);
    }


}