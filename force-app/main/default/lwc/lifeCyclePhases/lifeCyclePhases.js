import { LightningElement } from 'lwc';
export default class LifeCyclePhases extends LightningElement {
    prop1='Sudhanshu';
    prop2;
    constructor(){
        super();
        //console.log('Component is created');
        //console.log(this.prop1);
        //console.log(prop1);
        
    }
    connectedCallback() {
        //console.log('Component is inserted');
        
    }
    renderedCallback(){
        //console.log('component is rendered');
        
    }
    handleClick(){
        //this.prop1='TEST';
    }
    disconnectedCallback() {
        //console.log('Component is removed');
    }
    
}