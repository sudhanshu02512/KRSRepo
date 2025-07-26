import { LightningElement } from 'lwc';

export default class EventDispatching extends LightningElement {
    
    buttonClickHandler(event){
        console.log('button 1 Click');
        // Event disptaching on html element using standard event
        // const standardClick = new Event('click');
        const button2 = this.template.querySelector('[data-id="button-2"]');

        //Event disptaching on html element using custom event
        const customClickEvent = new CustomEvent('click',{
            detail:{
                message1:'hello',
                message2:'bye',
            }
        })
        //button2.dispatchEvent(customClickEvent);

        //Any Event
        const sudhanshuEvent = new CustomEvent('sudhanshu');
        button2.dispatchEvent(sudhanshuEvent);
    }

    button2ClickHandler(event){
        console.log('button 2 click');
        console.log(event.detail.message1);
        console.log(event.detail.message2)
    }
    sudhanshuHandler(){
        console.log('sudhanshu Event');
    }
}