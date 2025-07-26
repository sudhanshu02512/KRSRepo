import { LightningElement } from 'lwc';
import gsap from '@salesforce/resourceUrl/gsap';

export default class ThirdPartyJs extends LightningElement {
    renderedCallback(){
       gsap.from(".container", { opacity: 0, y: 100, duration: 5 });
    }
}