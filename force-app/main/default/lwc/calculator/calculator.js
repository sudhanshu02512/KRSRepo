import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    result;
    renderedCallback(){
        console.log('rendered');
        const inputElement1 = this.template.querySelector('[data-id="number-1"]');
        const inputElement2 = this.template.querySelector('[data-id="number-2"]');
        const addButton = this.template.querySelector('[data-id="add-button"]');

        // addButton.addEventListener("click",(event)=>{
        //     let number1 = Number(inputElement1.value);
        //     let number2 = Number(inputElement2.value);
        //     this.result=number1+number2;
        // })

    }
    
    addNumber(event){
            const inputElement1 = this.template.querySelector('[data-id="number-1"]');
            const inputElement2 = this.template.querySelector('[data-id="number-2"]');
            let number1 = Number(inputElement1.value);
            let number2 = Number(inputElement2.value);
            this.result=number1+number2;
    }
}