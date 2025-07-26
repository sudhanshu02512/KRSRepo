import { LightningElement } from 'lwc';
export default class ParentChildHook extends LightningElement {
    showChild=true;
    parentProp='Parent Prop';
    childProp;
    constructor(){
        super();
        console.log('parent is created');
    }
    connectedCallback() {
       console.log('parent is inserted');
       this.childProp={
            pubProp:'Sudhanshu'
        }
        
    }
    renderedCallback(){
        console.log('parent is rendered');
        
    }
    disconnectedCallback() {
        console.log('parent is deleted');
    }
    errorCallback(error, stack) {
        console.log('error occured on child');
        console.log(stack);
    }
    showHideChild(){
        if(this.showChild){
            this.showChild=false;
        }
        else{
             this.showChild=true;
        }
    }

    changeProp(){
        this.parentProp='Change Parent Prop';
    }
}