import { LightningElement,api  } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
let a =1;

export default class RecordNavigation extends NavigationMixin(LightningElement) {
    @api someObject = { value: 10 };
    navigateTo(){
        console.log(a);
        const el = this.template.querySelectorAll('div,lightning-card');
        console.log(el);
        this.someObject.value = 20;
        console.log(this.someObject.value);
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName:'list'
           },
        });
    }
}