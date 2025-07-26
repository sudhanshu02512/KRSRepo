import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    childProps={
        myProp3:"Hi",
        myProp4:"AD"
    }
    method1(){
        let childComponent = this.template.querySelector('c-child-component');
        childComponent.increaseNumBy1();
        this.refs.childComp.method2();
    }
    receiveProp(event){
        console.log(event);
        console.log(event.detail.fname);
        console.log(event.detail.lname);
    }
    method3(){
        console.log('Method3');
    }
    connectedCallback() {
        this.addEventListener("click",()=>{
            console.log('parent click');
        })
    }
}