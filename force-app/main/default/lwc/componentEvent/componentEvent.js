import { LightningElement } from 'lwc';
export default class ComponentEvent extends LightningElement {
    connectedCallback() {
        this.addEventListener("click",()=>{
            console.log('component is clicked');
        })
    }
}