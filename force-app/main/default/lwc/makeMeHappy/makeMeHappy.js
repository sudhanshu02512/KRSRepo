import { LightningElement } from 'lwc';
export default class MakeMeHappy extends LightningElement {
    renderedCallback(){
       const divElement = this.template.querySelector('div');
        const style = document.createElement('style');
        style.innerText = `
            span{
            text-emphasis: "😂";
            }
        `;
        divElement?.appendChild(style);
    }
}