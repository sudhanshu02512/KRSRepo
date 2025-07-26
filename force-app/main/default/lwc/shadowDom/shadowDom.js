import { LightningElement } from 'lwc';
export default class ShadowDom extends LightningElement {
    buttonClickHandler(){
        const articleElement = this.template.querySelector('article');
        console.log(articleElement);
    }
}