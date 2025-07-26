import { LightningElement } from 'lwc';
import htmlTemplate from './renderCheck2Child.html';

export default class RenderCheck2Child extends LightningElement {
    constructor(){
        super();
        console.log('Inside Constructor child');
    }

    connectedCallback(){
        console.log('inside connectedCallback child');
    }

    renderedCallback(){
        console.log('inside renderedCallback child');
    }
    render(){
        console.log('Inside render child');
        return htmlTemplate;
    }
}