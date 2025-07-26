import { LightningElement } from 'lwc';

export default class P1 extends LightningElement {
    errorCallback(){
        console.log('inside p1');
        console.log('error occured at c11');
    }
}