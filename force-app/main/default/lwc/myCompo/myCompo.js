import { LightningElement } from 'lwc';
import getResponse from '@salesforce/apex/MyClass2.getResponse';

export default class MyCompo extends LightningElement {
    connectedCallback() {
        getResponse().then((res)=>{
            console.log('My Class2');
            console.log(res);
        })
    }
}