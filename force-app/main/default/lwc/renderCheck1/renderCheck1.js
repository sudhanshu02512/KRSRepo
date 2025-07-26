import { LightningElement } from 'lwc';
import htmlTemplate from './renderCheck1.html';

export default class RenderCheck1 extends LightningElement {
    constructor(){
        super();
        console.log('Inside Constructor');
    }

    connectedCallback(){
        console.log('inside connectedCallback');
    }

    renderedCallback(){
        console.log('inside renderedCallback');
    }
    render(){
        console.log('Inside render');
        return htmlTemplate;
    }
}