import { LightningElement,api } from 'lwc';
import { NavigationMixin } from "lightning/navigation";
export default class LifeCycleHook extends LightningElement {
    //Component is created
    prop1="Sudhanshu";
    @api recordId;
    @api prop2='Pre3';
    showChild=true;
    accountHomePageRef;
    constructor(){
        super();
        // console.log('Inside Constructor');
        // console.log(this.prop1);
        // this.method1();
        // let divElement = this.template.querySelector('div[data-id="div1"]');
        // console.log(divElement);
        // console.log(this.prop2);
        // console.log(this.recordId);
        // this.publicMethod();
    }
    connectedCallback() {
        // console.log('Inside Connected Callback');
        // console.log(this.prop1);
        // console.log(this.recordId);
        // console.log(this.prop2);
        // this.method1();

        // let divElement = this.template.querySelector('div[data-id="div1"]');
        // console.log(divElement);
        // this.publicMethod();
        // this.template.addEventListener("click",()=>{
        //     console.log('click');
        // });
        // this.addEventListener("click",()=>{
        //     console.log('click this');
        // });
        // const ev = new Event("click");
        // this.dispatchEvent(ev);
        // this.accountHomePageRef = {
        //         type: "standard__objectPage",
        //         attributes: {
        //         objectApiName: "Account",
        //         actionName: "home",
        //     },
        // };
        // console.dir(NavigationMixin);

    }
    renderedCallback(){
        // console.log('Inside Rendered Callback');
        // console.log(this.prop1);
        // console.log(this.recordId);
        // this.method1();
        // let divElement = this.template.querySelector('div[data-id="div1"]');
        // console.log(divElement);
        // this.classList.add("new-class");
        // console.log(this.prop2);
        // console.log(this.recordId);
    //   console.dir(this);
    //   console.dir(this.template);
        //console.log(hasRendered)
    }
    // errorCallback(error, stack) {
    //     console.log('error ocurred');
    //     console.log(error);
    //     console.log(stack);
    // }

    method1(){
        //console.log('method 1');
    }
    @api publicMethod(){
        console.log('public Method');
    }

    handleClick(){
        if(this.showChild){
            this.showChild=false;
        }
        else{
            this.showChild=true;
        }
    }
}