import { LightningElement,api } from 'lwc';
export default class ConnectedCallback extends LightningElement {
    showDiv=true;
    prop1='Sudhanshu';
    @api prop2='SR';
    constructor(){
        super();
        console.log('inside contructor');
    }
    connectedCallback(){
        console.log('inside connectedCallback');
    }
    renderedCallback(){
         console.log('inside renderedCallback');
    }
    disconnectedCallback() {
        console.log('inside disconnectedCallback');
        this.prop1="sjak";
        console.log(this.prop1);
        console.log(this.prop2);
        console.log(this.method1());
        const divEle = this.template.querySelector('div');
        console.log(divEle);
    }

    method1(){
        console.log('inside method');
    }
    buttonHandler(){
        const liEle = this.template.querySelector('lightning-card');
            const divEle = document.createElement('div');
            liEle.appendChild(divEle);
        // const div = this.template.querySelector('div');
        // if(div){
        //      div.remove();
        // }
        // else{
        //     const liEle = this.template.querySelector('lightning-card');
        //     const divEle = document.createElement('div');
        //     liEle.appendChild(divEle);
        // }
       

        // if(this.showDiv){
        //     this.showDiv=false;
        // }
        // else{
        //     this.showDiv=true;
        // }
    }
}