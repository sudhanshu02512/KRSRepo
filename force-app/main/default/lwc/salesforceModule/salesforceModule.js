import { LightningElement } from 'lwc';
import label1 from '@salesforce/label/c.myLabel';
import {name,f1,MyClass,obj1} from './myScript';
import EXPR from './myScript2';


let v1="S1";

export default class SalesforceModule extends LightningElement {
    prop1= name;
    method1=f1;
    myClassObj = new MyClass();
    method1=EXPR;
    //prop1 = obj1.prop1;
    prop2 = label1;
}