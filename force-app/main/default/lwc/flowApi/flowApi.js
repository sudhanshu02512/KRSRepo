import { LightningElement,api } from 'lwc';
export default class FlowApi extends LightningElement {
    @api propInput = 'Default Value';
    //@api propOutput;
    @api output1 ='Output Value 1';
    @api output2 ='Output Value 2';

    inputHandler1(ev){
        this.output1 = ev.detail.value;
    }
    inputHandler2(ev){
        this.output2 = ev.detail.value;
    }
}